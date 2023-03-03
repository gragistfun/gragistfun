#
# OPTIONS
#
# Reference:
# https://zsh.sourceforge.io/Doc/Release/Options.html

setopt PROMPT_SUBST # needed for vcs_info


#
# PROMPT
#
# References:
# https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html
# Version Control: http://zsh.sourceforge.net/Doc/Release/User-Contributions.html

autoload -U colors
colors

# Version control
autoload -Uz vcs_info

precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '(%b)'

PROMPT='%F{#6272a4}[%T]%f %F{green}%~%f ${vcs_info_msg_0_} ▶ '


#
# ALIASES
#

alias ...='cd ../..'
alias cp="cp -riv"
alias la='ls -A'
alias ll='ls -lA'
alias mkdir="mkdir -vp"
alias mv="mv -iv"
alias vi='nvim'
alias vim='nvim'


#
# FUNCTIONS
#

function ccd() {
    mkdir "$1" && cd "$1"
}

# git wrapper:
# - git with no arguments = git status; run git help to show what
#   vanilla git without arguments would normally show.
# - git root = cd to repo root.
# - ROOT=$(git root) = no args and stdout is not a tty; prints the root.
# - git root ARG... = evals ARG... from the root (eg. git root ls).
# - git ARG... = behaves just like normal git command.
# Adopted form: github.com/wincent
function git() {
    if [ $# -eq 0 ]; then
        command git status
    elif [ "$1" = root ]; then
        shift
        local ROOT

        ROOT="$(command git rev-parse --show-superproject-working-tree 2> /dev/null)"
        if [ -z "$ROOT" ]; then
            ROOT="$(command git rev-parse --show-toplevel 2> /dev/null)"
        fi

        if [ -z "$ROOT" ]; then
            ROOT="$PWD"
        fi
        if [ $# -eq 0 ]; then
            if [ -t 1 ]; then
                cd "$ROOT"
            else
                echo "$ROOT"
            fi
        else
            (cd "$ROOT" && eval "$@")
        fi
    else
        command git "$@"
    fi
}

function reload() {
    source ~/.zshrc && echo 'Config reloaded!'
}


#
# VI MODE
#

VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VI_MODE_SET_CURSOR=true

typeset -g VI_KEYMAP=main

function _vi-mode-set-cursor-shape-for-keymap() {
    local _shape=0

    case "${1:-${VI_KEYMAP:-main}}" in
        main)    _shape=6 ;; # vi insert: line
        viins)   _shape=6 ;; # vi insert: line
        isearch) _shape=6 ;; # inc search: line
        command) _shape=6 ;; # read a command name
        vicmd)   _shape=2 ;; # vi cmd: block
        visual)  _shape=2 ;; # vi visual mode: block
        viopp)   _shape=0 ;; # vi operation pending: blinking block
        *)       _shape=0 ;;
    esac

    printf $'\e[%d q' "${_shape}"
}

function zle-keymap-select() {
    typeset -g VI_KEYMAP=$KEYMAP

    if [[ "${VI_MODE_RESET_PROMPT_ON_MODE_CHANGE:-}" = true ]]; then
        zle reset-prompt
        zle -R
    fi
    _vi-mode-set-cursor-shape-for-keymap "${VI_KEYMAP}"
}
zle -N zle-keymap-select

function zle-line-init() {
    local prev_vi_keymap
    prev_vi_keymap="${VI_KEYMAP:-}"
    typeset -g VI_KEYMAP=main
    [[ "$prev_vi_keymap" != 'main' ]] && [[ "${VI_MODE_RESET_PROMPT_ON_MODE_CHANGE:-}" = true ]] && zle reset-prompt
    (( ! ${+terminfo[smkx]} )) || echoti smkx
    _vi-mode-set-cursor-shape-for-keymap "${VI_KEYMAP}"
}
zle -N zle-line-init

function zle-line-finish() {
    typeset -g VI_KEYMAP=main
    (( ! ${+terminfo[rmkx]} )) || echoti rmkx
    _vi-mode-set-cursor-shape-for-keymap default
}
zle -N zle-line-finish

bindkey -v

bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^r' history-incremental-search-backward
bindkey '^w' backward-kill-word

if [[ -z "$MODE_INDICATOR" ]]; then
  MODE_INDICATOR='%B%F{red}<%b<<%f'
fi

function vi_mode_prompt_info() {
  echo "${${VI_KEYMAP/vicmd/$MODE_INDICATOR}/(main|viins)/$INSERT_MODE_INDICATOR}"
}

if [[ -z "$RPS1" && -z "$RPROMPT" ]]; then
  RPROMPT='$(vi_mode_prompt_info)'
fi


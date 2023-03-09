#
# VARIABLES
#

export EDITOR='nvim'
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT='-c'
export PAGER='bat -p'

# History
export HISTFILE="$HOME/.cache/zsh-history"
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE

#
# OPTIONS
#
# Reference:
# https://zsh.sourceforge.io/Doc/Release/Options.html

setopt APPEND_HISTORY          # append to history file on shell exit
setopt CORRECT_ALL             # argument auto-correction
setopt CORRECT                 # command auto-correction
setopt HIST_FIND_NO_DUPS       # don't show dupes when searching
setopt HIST_IGNORE_DUPS        # do filter contiguous duplicates from history
setopt HIST_IGNORE_SPACE       # don't record commands starting with a space
setopt HIST_VERIFY             # confirm history expansion (!$, !!, !foo)
setopt NO_HIST_IGNORE_ALL_DUPS # don't filter non-contiguous duplicates from history
setopt PROMPT_SUBST            # enable parameter expansion. needed for vcs_info
setopt SHARE_HISTORY           # share history across shells


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

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats "(%F{green}%u%c%b%m%f)"
zstyle ':vcs_info:*' actionformats "(%F{cyan}%b%m|%a%f)"
zstyle ':vcs_info:*' stagedstr "%F{yellow}"
zstyle ':vcs_info:*' unstagedstr "%F{red}"
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

+vi-git-untracked() {
  if git --no-optional-locks status --porcelain 2> /dev/null | grep -q "^??"; then
    hook_com[misc]+="+"
  fi
}

function prompt {
    echo -n '%F{#6272a4}[%T]%f '    # current time (purple)
    echo -n '%F{green}%~%f '        # current path (green)
    echo -n "${vcs_info_msg_0_} "   # version control info
    echo -n '▶ '                    # unicode prompt symbol (for tmux jump to last prompt)
}

PROMPT='$(prompt)'

#
# COMPLETION
#

autoload -U compinit
compinit -u

# Make completion:
# - Try exact (case-sensitive) match first.
# - Then fall back to case-insensitive.
# - Accept abbreviations after . or _ or - (ie. f.b -> foo.bar).
# - Substring complete (ie. bar -> foobar).
zstyle ':completion:*' matcher-list '' '+m:{[:lower:]}={[:upper:]}' '+m:{[:upper:]}={[:lower:]}' '+m:{_-}={-_}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Colorize completions using default `ls` colors.
zstyle ':completion:*' list-colors ''

# Allow completion of ..<Tab> to ../ and beyond.
zstyle -e ':completion:*' special-dirs '[[ $PREFIX = (../)#(..) ]] && reply=(..)'

# $CDPATH is overpowered (can allow us to jump to 100s of directories) so tends
# to dominate completion; exclude path-directories from the tag-order so that
# they will only be used as a fallback if no completions are found.
zstyle ':completion:*:complete:(cd|pushd):*' tag-order 'local-directories named-directories'

# Enable keyboard navigation of completions in menu
# (not just tab/shift-tab but cursor keys as well):
zstyle ':completion:*' menu select


#
# ALIASES
#

alias ...='cd ../..'
alias cp="nocorrect cp -riv"
alias la='ls -A'
alias ll='ls -lA'
alias man='nocorrect man'
alias mkdir="nocorrect mkdir -vp"
alias mv="nocorrect mv -iv"
alias py='python'
alias s='sudo'
alias sudo='nocorrect sudo'
alias vi='nvim'
alias vim='nvim'

# Global aliases
alias -g G='| rg -i'
alias -g H='| head'
alias -g P='| bat -p'
alias -g S='systemctl'
alias -g T='| tail'

#
# ALIAS EXPANSION
#
# Adopted form https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/globalias/globalias.plugin.zsh

# Exclude aliases
GLOBALIAS_FILTER_VALUES=(cp la ll man mkdir mv sudo)

globalias() {
    # Get last word to the left of the cursor:
    # (z) splits into words using shell parsing
    # (A) makes it an array even if there's only one element
    local word=${${(Az)LBUFFER}[-1]}
    if [[ $GLOBALIAS_FILTER_VALUES[(Ie)$word] -eq 0 ]]; then
        zle _expand_alias
        zle expand-word
    fi
    zle self-insert
}
zle -N globalias

# space expands all aliases, including global
bindkey -M viins " " globalias

# control-space to make a normal space
bindkey -M viins "^ " magic-space

# normal space during searches
bindkey -M isearch " " magic-space


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

function myip {
    # Get ip address over DNS
    dig +short myip.opendns.com @resolver1.opendns.com -4
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

# Insert mode
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^N' down-history
bindkey '^P' up-history
bindkey '^r' history-incremental-search-backward
bindkey '^w' backward-kill-word

# Normal mode
bindkey -M vicmd 'j' down-history
bindkey -M vicmd 'k' up-history

if [[ -z "$MODE_INDICATOR" ]]; then
  MODE_INDICATOR='%B%F{red}<%b<<%f'
fi

function vi_mode_prompt_info() {
  echo "${${VI_KEYMAP/vicmd/$MODE_INDICATOR}/(main|viins)/$INSERT_MODE_INDICATOR}"
}

if [[ -z "$RPS1" && -z "$RPROMPT" ]]; then
  RPROMPT='$(vi_mode_prompt_info)'
fi


#
# AUTOSUGGESTIONS
# 
# Install system package 'zsh-autosuggestions' or similar

# Source system installed file
ZSH_AUTOSUGGESTIONS_FILE='/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh'
if [[ -f $ZSH_AUTOSUGGESTIONS_FILE ]]; then
    source $ZSH_AUTOSUGGESTIONS_FILE
fi

# - match the most recent match whose preceding history item matches the
#   most recently executed command
# - fall back on suggestion based on what tab-completion would suggest.
ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd completion)

# ignore history completions for `cd` since it is most likely a relative jump
# which makes no sense in the changed context
ZSH_AUTOSUGGEST_HISTORY_IGNORE='cd *'

bindkey '^F' autosuggest-accept


#
# SYNTAX HIGHLIGHTING
# 
# Install system package 'zsh-syntax-highlighting' or similar
# Must be sourced last: https://github.com/zsh-users/zsh-syntax-highlighting#why-must-zsh-syntax-highlightingzsh-be-sourced-at-the-end-of-the-zshrc-file

# Source system installed file
SYNTAX_HIGHLIGHTING_FILE='/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'
if [[ -f $SYNTAX_HIGHLIGHTING_FILE ]]; then
    source $SYNTAX_HIGHLIGHTING_FILE
fi


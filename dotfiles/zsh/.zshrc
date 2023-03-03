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
    source ~/.zshrc
    echo 'Config reloaded!'
}


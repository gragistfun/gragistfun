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

function reload() {
    source ~/.zshrc
    echo 'Config reloaded!'
}


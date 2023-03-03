#
# PROMPT
#
# Reference: https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html

autoload -U colors
colors

PROMPT='%F{#6272a4}[%T]%f %F{green}%~%f ▶ '

#
# FUNCTIONS
#

function reload() {
    source ~/.zshrc
    echo 'Config reloaded!'
}


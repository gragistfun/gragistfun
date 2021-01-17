# Options
if [ ! -d $HOME/.cache/zsh ]; then
	mkdir $HOME/.cache/zsh
fi
export ZSH_CACHE_DIR=$HOME/.cache/zsh

setopt AUTO_PARAM_SLASH # add slash after dir completion
setopt HIST_VERIFY # confirm history call

# XDG
export XDG_CONFIG_HOME="$HOME/.config"

# Components
ZSH_CONFIG_DIR="$XDG_CONFIG_HOME/zsh"

source $ZSH_CONFIG_DIR/functions.sh
source $ZSH_CONFIG_DIR/aliases.sh

# Completion
source $ZSH_CONFIG_DIR/completion.sh

# Correction
source $ZSH_CONFIG_DIR/correction.sh

# Appearance
source $ZSH_CONFIG_DIR/appearance.sh

# History
export HISTSIZE=100000
export HISTFILE="$ZSH_CACHE_DIR/history"
export SAVEHIST=$HISTSIZE

# Prompt
setopt PROMPT_SUBST
export PROMPT='$(pwd_abbreviation --zsh) \$ '

# Exports
source $ZSH_CONFIG_DIR/exports.sh

# Plugins
for plugin_file in $ZSH_CONFIG_DIR/plugins/*; do
	source  $plugin_file
done

# Preserve standard shell keybindings like C-a and C-r
bindkey -e

# Tmux
if ! tmux has-session 2>/dev/null \
   && [ -n "$PS1" ] \
   && [[ ! "$TERM" =~ screen ]] \
   && [[ ! "$TERM" =~ tmux ]] \
   && [ -z "$TMUX" ] \
   && command -v tmux &> /dev/null ; then
	  exec tmux
fi

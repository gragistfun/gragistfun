# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Start tmux session
if ! tmux has-session 2>/dev/null \
   && [ -n "$PS1" ] \
   && [[ ! "$TERM" =~ screen ]] \
   && [[ ! "$TERM" =~ tmux ]] \
   && [ -z "$TMUX" ] \
   && command -v tmux &> /dev/null ; then
	  exec tmux -u
fi


autoload -U colors
colors

export LSCOLORS="Gxfxcxdxbxegedabagacad"

# enable ls colors if possible
ls --color -d . &>/dev/null && alias ls='ls --color=tty' || { ls -G . &>/dev/null && alias ls='ls -G' }

zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# enable diff color if possible.
if command diff --color . . &>/dev/null; then
	alias diff='diff --color'
fi

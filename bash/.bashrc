#              __________________ 
#          /\  \   __           /  /\    /\           Author      : Aniket Meshram [AniGMe]
#         /  \  \  \         __/  /  \  /  \          Description : Bashrc configurations.
#        /    \  \       _____   /    \/    \
#       /  /\  \  \     /    /  /            \        Github Repo : https://github.com/aniketgm/dotfiles
#      /        \  \        /  /      \/      \
#     /          \  \      /  /                \ 
#    /            \  \    /  /                  \
#   /              \  \  /  /                    \
#  /__            __\  \/  /__                  __\
#

# [ -z "$TMUX" ] && { tmux -a attach || exec tmux -u new-session && exit; }

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Add $HOME/bin and $HOME/.local/bin to PATH
if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/local/bin:$PATH"
fi

# Define browser variable
if [ -x /usr/bin/firefox ]; then
    export BROWSER="/usr/bin/firefox"
fi

# Check if Windows access is enabled and set a var for it.
if [ -d "/mnt/c/Users/Aniket" ]; then
    WIN_HOME="/mnt/c/Users/Aniket"
fi
if [ -d "/mnt/d/SummuData" ]; then
    WIN_D_DRIVE="/mnt/d/SummuData"
fi

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
shopt -s histappend
shopt -s autocd
#shopt -s globstar

HISTCONTROL=ignoreboth:erasedups
HISTSIZE=10000
HISTFILESIZE=20000

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alhF --group-directories-first'
alias la='ls -A --group-directories-first'
alias l='ls -CF'
if [ -x /usr/bin/exa ]; then
    alias lse='exa -al -s type --group-directories-first'
    alias lss='exa -al -s size --group-directories-first'
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Store custom functions in .bash_functions
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Set greeting messages: using fortune OR neofetch
if type colorscript &>/dev/null; then
    colorscript random
elif type fortune &>/dev/null && type cowsay &>/dev/null && type lolcat &>/dev/null; then
    fortune | cowsay -f $(ls /usr/share/cowsay/cows/ | shuf -n1) | lolcat
elif type neofetch &>/dev/null; then
    neofetch
else
    echo ""
    echo " The journey of a thousand miles begins with one step."
    echo "                                                 - Lao Tzu"
    echo ""
    echo "Seems non of colorscript by [DistroTube] OR fortune OR neofetch is installed."
    echo "Note you will be getting this same quote everytime bash prompt is launched."
fi

# TimeWarrior env var
# export TIMEWARRIORDB="$HOME/.config/task/.timewarrior"

# Jump shell
# eval "$(jump shell)"

# Zoxide shell (similar to Jump)
eval "$(~/.local/bin/zoxide init bash)"

# Starship Prompt
eval "$(starship init bash)"

##-----------------------------------------------------
# Generated for envman. Do not edit.
# [ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"


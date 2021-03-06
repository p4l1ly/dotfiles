#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source /etc/bash/bashrc.d/bash_completion.sh

export HISTCONTROL=ignoredups

export HISTFILESIZE=100000
export HISTSIZE=100000

export EDITOR=/usr/bin/vim

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

force_color_prompt=yes
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
    PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\W\[\e[m\]\[\e[1;32m\]\$\[\e[m\] \[\e[;0m\]'
else
    PS1='\u \W\$ '
fi
unset color_prompt force_color_prompt


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

alias tmux="TERM=screen-256color tmux"

fortune | cowsay -f "$(ls /usr/share/cowsay-3.03/cows/ | sort -R | head -n1)"

#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTCONTROL=ignoredups

export HISTFILESIZE=100000
export HISTSIZE=100000

export EDITOR=/usr/local/bin/vim

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\W\[\e[m\]\[\e[1;32m\]\$\[\e[m\] \[\e[;37m\]'

export LSCOLORS='EagafaFacaDadaCaCdeaaE'
export CLICOLOR=1
export TERM=xterm-color

# enable color support of ls and also add handy aliases
alias ls='ls -G'
alias grep='grep --color=auto'

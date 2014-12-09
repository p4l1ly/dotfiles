#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\W\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[;37m\]'
export PATH=$HOME/.cabal/bin:$HOME/.gem/ruby/2.1.0/bin:$PATH

export HISTFILESIZE=100000
export HISTSIZE=100000
export HISTCONTROL=ignoredups

export EDITOR=/usr/bin/vim

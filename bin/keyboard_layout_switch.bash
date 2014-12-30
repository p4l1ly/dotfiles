#!/bin/bash
#switch between keyboard layouts

if [[ -n "$1" ]]; then
  if [ $1 = sk ]; then
    setxkbmap sk qwerty
  else
    setxkbmap us
  fi
else
  layout=$(setxkbmap -query | awk '/layout:/{print $2}')
  case $layout in
    us)
        setxkbmap sk qwerty
      ;;
    *)
        setxkbmap us
      ;;
  esac
fi

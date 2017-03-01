#!/bin/bash

export PATH=$PATH:~/bin
export git=/Users/ybadiss/Documents/git

function parse_git_dirty {
  number_changes=$(git status --porcelain 2> /dev/null | grep "^[^\?\!]" | wc -l)
  #last_line=$(git status 2> /dev/null | tail -n1)
  #[[ $last_line != "nothing to commit (working directory clean)" ]] && echo "*"
  [[ $number_changes -ne 0 ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\(\1$(parse_git_dirty)\)/"
}

function proml {
  # regular colors
  local K="\[\033[0;30m\]"    # black
  local R="\[\033[0;31m\]"    # red
  local G="\[\033[0;32m\]"    # green
  local Y="\[\033[0;33m\]"    # yellow
  local B="\[\033[0;34m\]"    # blue
  local M="\[\033[0;35m\]"    # magenta
  local C="\[\033[0;36m\]"    # cyan
  local W="\[\033[0;37m\]"    # white

  # emphasized (bolded) colors
  local BK="\[\033[1;30m\]"
  local BR="\[\033[1;31m\]"
  local BG="\[\033[1;32m\]"
  local BY="\[\033[1;33m\]"
  local BB="\[\033[1;34m\]"
  local BM="\[\033[1;35m\]"
  local BC="\[\033[1;36m\]"
  local BW="\[\033[1;37m\]"

  TITLEBAR='\[\033]0;\u@\h:\w\007\]'

  PS1="$W${TITLEBAR}\
\u@\h:$C\w $Y\$(parse_git_branch)\

$W\$ "

  PS2='> '

  PS4='+ '

}

proml

alias ls="ls -G"
alias ll="ls -lah"
alias grep="grep --color=auto"

#!/bin/bash

if [ "`uname`" == 'Darwin' ]; then
  PATH=$PATH:/Users/derbuihan/Library/Android/sdk/platform-tools
  PATH=$PATH:/usr/local/bin
  PATH=$PATH:/usr/local/opt/coreutils/libexec/gnubin
  MANPATH=$MANPATH:/usr/local/opt/coreutils/libexec/gnubin
  alias ls="gls --color=auto"
  alias df="gdf -h"
else
  alias ls="ls --color=auto"
  alias df="df -h"
fi

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

if which free > /dev/null; then
  alias free="free -h"
fi

if which jq > /dev/null; then
  alias gip="wget -q -O - 'http://httpbin.org/ip' | cat - | jq -r '.origin'"
else
  alias gip="wget -q -O - 'http://httpbin.org/ip' | cat -"
fi

#if test `which tor > /dev/null` -a `which polipo > /dev/null`; then
#  export http_proxy=http://localhost:8123
#  export HTTP_PROXY=$http_proxy
#  export https_proxy=$http_proxy
#  export HTTPS_PROXY=$http_proxy
#fi

alias la="ls -a"
alias ll="ls -l"
alias lf="ls --full-time"
alias lal="la -l"
alias lla="ll -a"
alias lfa="lf -a"
alias laf="la --full-time"

#!/bin/bash

if [ "`uname`" == 'Darwin' ]; then
  PATH=$PATH:/Users/derbuihan/Library/Android/sdk/platform-tools
  PATH=$PATH:/usr/local/bin
  PATH=$PATH:/usr/local/opt/coreutils/libexec/gnubin
  MANPATH=$MANPATH:/usr/local/opt/coreutils/libexec/gnubin
  alias ls="gls --color=auto"
else
  alias ls="ls --color=auto"
fi
alias df="df -h"
alias la="ls -a"
alias ll="ls -l"


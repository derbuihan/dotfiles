#!/bin/bash

PROMPT="%F{6}%n@%m %~ $%f "

export PYENV_ROOT="${HOME}/.pyenv"
if [ ! -d "${PYENV_ROOT}" ]; then
  git clone https://github.com/yyuu/pyenv.git ~/.pyenv
  git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
fi
if [ -d "${PYENV_ROOT}" ]; then
  export PATH=${PYENV_ROOT}/bin:$PATH
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

# rbenv
export RBENV_ROOT="${HOME}/.rbenv"
if [ ! -d "${RBENV_ROOT}" ]; then
  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
  git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
fi
if [ -d "${RBENV_ROOT}" ]; then
  export PATH=${RBENV_ROOT}/bin:$PATH
  eval "$(rbenv init -)"
fi

if [ "`uname`" = 'Darwin' ]; then
  PATH=$PATH:/Users/derbuihan/Library/Android/sdk/platform-tools
  PATH=$PATH:/usr/local/bin
  PATH=$PATH:/usr/local/opt/coreutils/libexec/gnubin
  MANPATH=$MANPATH:/usr/local/opt/coreutils/libexec/gnubin
  export PATH=/usr/local/Cellar/smlnj/110.76/libexec/bin:$PATH
  alias ls="gls --color=auto"
  alias df="gdf"
  alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
else
  alias ls="ls --color=auto"
  alias df="df"
fi

if which free > /dev/null; then
  alias free="free -h"
fi

# chech my global ip address.
if which jq > /dev/null; then
  alias gip="wget -q -O - 'http://httpbin.org/ip' | cat - | jq -r '.origin'"
else
  alias gip="wget -q -O - 'http://httpbin.org/ip' | cat -"
fi

if which tmux > /dev/null; then
  if [ ! -e ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  fi
fi

# tor proxy
#if test `which tor > /dev/null` -a `which polipo > /dev/null`; then
#  export http_proxy=http://localhost:8123
#  export HTTP_PROXY=$http_proxy
#  export https_proxy=$http_proxy
#  export HTTPS_PROXY=$http_proxy
#fi

# alias
alias sl="ls"
alias la="ls -a"
alias ll="ls -l"
alias lf="ls --full-time"
alias lal="la -l"
alias lla="ll -a"
alias lfa="lf -a"
alias laf="la --full-time"
alias df="df -h"
alias wget="wget -e robots=off"
alias tubame-proxy="ssh -f -N -D 1080 tubame"
alias fig='docker-compose'
alias rm='rmtrash'

# zsh history
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY

# zsh plugin maneger
if [[ ! -d ~/.zplug ]];then
  git clone https://github.com/zplug/zplug ~/.zplug
fi
source ~/.zplug/init.zsh
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search", hook-build:"__zsh_version 4.3"
if ! zplug check; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi
zplug load

# opam configuration
test -r /Users/derbuihan/.opam/opam-init/init.zsh && . /Users/derbuihan/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

#!/bin/zsh

#PROMPT="%F{6}%n@%m %~ $%f "

# setting for MacOS
if [ "`uname`" = 'Darwin' ]; then
  # brew instll coreutils
  alias ls="gls --color=auto"
  alias df="gdf"

  # brew install rmtrash 
  alias rm="rmtrash"
fi

# nvim 
if which nvim > /dev/null 2>&1; then
  # brew install nvim
  alias vim="nvim"
fi

# haskell stack
if which stack > /dev/null 2>&1; then
  # brew install stack
  alias ghc='stack ghc --'
  alias ghci='stack ghci --'
fi

# fzf
if [[ ! -d ~/.fzf ]]; then
  echo "Install fzf"
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install --bin
fi
if [[ ! "$PATH" == *$HOME/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}$HOME/.fzf/bin"
fi
[[ $- == *i* ]] && source "$HOME/.fzf/shell/completion.zsh" 2> /dev/null
source "$HOME/.fzf/shell/key-bindings.zsh"
export FZF_COMPLETION_TRIGGER=''
bindkey '^T' fzf-completion
bindkey '^I' $fzf_default_completion

if [[ -n "$TMUX" ]]; then
  # brew install tmux
  export FZF_TMUX=1
  export FZF_TMUX_HEIGHT='60%'
fi

# alias
# brew install wget
alias gip="wget -q -O - 'http://httpbin.org/ip' | cat -"
alias free="free -h"
alias sl="ls"
alias la="ls -a"
alias ll="ls -l"
alias lal="la -l"
alias lla="ll -a"
alias df="df -h"
function cd(){
    builtin cd $@ && ls;
}

# zsh history
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt share_history
setopt extended_history
setopt hist_reduce_blanks
autoload -Uz compinit && compinit -C

# gcloud
#source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
#source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

# Golang
if [[ ! -d $HOME/.go ]]; then
  export GOPATH=$HOME/.go
fi


# Python
if [[ -d /usr/local/anaconda3 ]]; then
  source /usr/local/anaconda3/etc/profile.d/conda.sh
elif [[ -d $HOME/.pyenv ]]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

# Rust
if [[ -d $HOME/.cargo ]]; then
  export PATH="$HOME/.cargo/bin:$PATH"
fi

# Blender
if [[ -d /Applications/Blender.app ]]; then
  alias blender="/Applications/Blender.app/Contents/MacOS/Blender"
fi

## zsh plugin maneger
if [[ ! -d ~/.zinit ]]; then
  echo "Install zinit"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
fi
source $HOME/.zinit/bin/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit ice wait'!0'; zinit light "zsh-users/zsh-syntax-highlighting" 
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

zinit ice wait'!0'; zinit light "zsh-users/zsh-completions"

zinit light "zsh-users/zsh-autosuggestions"

zinit ice pick"async.zsh" src"pure.zsh"
zinit light "sindresorhus/pure"

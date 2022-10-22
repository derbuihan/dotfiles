#!/bin/zsh

# setting for MacOS
if [ "`uname`" = 'Darwin' ]; then
  # brew instll coreutils
  alias ls="gls --color=auto"
  alias df="gdf"

  # qt5
  export PATH="/opt/homebrew/opt/qt5/bin:$PATH"

  # brew install trash 
  alias rm="trash"
  
  # brew install colordiff
  alias diff="colordiff"

  # Apple Silicon
  eval "$(/opt/homebrew/bin/brew shellenv)"
  export SDKROOT="$(xcrun --sdk macosx --show-sdk-path)"

  # TeX
  eval "$(/usr/libexec/path_helper)"
fi

# nvim 
if which nvim > /dev/null 2>&1; then
  #brew install nvim
  #alias vim="nvim"
fi
export EDITOR=vim

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

# direnv
if which direnv > /dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

# colima
if which colima > /dev/null 2>&1; then
  export DOCKER_HOST="unix://$HOME/.colima/docker.sock"
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

# anyenv
eval "$(anyenv init - --no-rehash)"

# Python
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/derbuihan/.anyenv/envs/pyenv/versions/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/derbuihan/.anyenv/envs/pyenv/versions/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/derbuihan/.anyenv/envs/pyenv/versions/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/derbuihan/.anyenv/envs/pyenv/versions/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# Rust
if [[ -d $HOME/.cargo ]]; then
  export PATH="$HOME/.cargo/bin:$PATH"
fi

# Go
if [[ -d $HOME/.go ]]; then
  export GOPATH="$HOME/.go"
  export PATH=$PATH:$GOPATH/bin
fi


## zsh plugin maneger
if [[ ! -d ~/.local/share/zinit ]]; then
  echo "Install zinit"
  sh -c "$(curl -fsSL https://git.io/zinit-install)"
fi
source $HOME/.local/share/zinit/zinit.git/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit ice wait'!0' lucid; zinit light "zsh-users/zsh-syntax-highlighting" 
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

zinit ice wait'!0' lucid; zinit light "zsh-users/zsh-completions"

zinit light "zsh-users/zsh-autosuggestions"

zinit ice pick"async.zsh" src"pure.zsh"
zinit light "sindresorhus/pure"

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk



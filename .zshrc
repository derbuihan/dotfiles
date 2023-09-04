#!/bin/zsh

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

# brew install nvim
alias vim="nvim"
export EDITOR=nvim

# brew install stack
alias ghc='stack ghc --'
alias ghci='stack ghci --'

# brew install fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# brew install tmux
export FZF_TMUX=1
export FZF_TMUX_HEIGHT='60%'

# brew install direnv
eval "$(direnv hook zsh)"

# brew install colima
export DOCKER_HOST="unix://$HOME/.colima/docker.sock"

# Rust
if [[ -d $HOME/.cargo ]]; then
  export PATH="$HOME/.cargo/bin:$PATH"
fi

# Go
if [[ -d $HOME/.go ]]; then
  export GOPATH="$HOME/.go"
  export PATH=$PATH:$GOPATH/bin
fi

# alias
alias gip="curl ifconfig.io"
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

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit ice pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

#!/bin/bash

PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:    \[\033[01;34m\]\w\[\033[00m\]\$ '
alias ls="gls --color=auto"
alias df="df -h"
alias ghc='stack ghc --'
alias ghci='stack ghci --'
alias runhaskell='stack runhaskell --'


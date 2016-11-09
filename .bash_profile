#!/bin/bash

PATH=$PATH:/Users/derbuihan/Library/Android/sdk/platform-tools:/usr/local/bin:/usr/local/opt/coreutils/libexec/gnubin
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

export PATH="$PATH:/Applications/microchip/xc8/v1.38/bin"

export PATH="$PATH:"/Applications/microchip/xc16/v1.26/bin""

export PATH="$PATH:"/Applications/microchip/xc32/v1.42/bin""

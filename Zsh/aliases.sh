#!/bin/bash

# List
alias l='ls -FG'
alias la='ls -FGalh'
alias ll='ls -FG1'

# Proxy
alias proxy='export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:789'
alias unproxy='unset all_proxy http_proxy https_proxy'

# Lock Screen
alias lockscreen='pmset displaysleepnow'

# Reload settings or hardware
alias reload!="source $zshrc"
alias reload="echo 'Use \"reload!\" instead'"

# For Flutter exec
export CHROME_EXECUTABLE="/Applications/Microsoft Edge.app/Contents/MacOS/Microsoft Edge"

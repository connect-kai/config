#!/bin/bash

# List
alias l='ls -FG'
alias la='ls -FGalh'
alias ll='ls -FG1'

# Lock Screen
alias lockscreen='pmset displaysleepnow'

# Reload settings or hardware
alias reload!="source $zshrc"
alias reload="echo 'Use \"reload!\" instead'"

# Python
python() { command python3 "$@"; }
pip() { command pip3 "$@"; }

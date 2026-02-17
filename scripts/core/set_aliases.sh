#!/bin/bash

# this script appends some aliases to .bash_aliases
# to set executable flag in git, do `git update-index --chmod=+x /path/to/script.sh`

cat >> ~/.bash_aliases << EOF
# general
alias ll='ls -alF'
alias up='sudo apt update && sudo apt upgrade -y --no-install-recommends && sudo apt autoremove -y'
alias ups='sudo apt update && sudo apt upgrade -y --no-install-recommends && sudo apt autoremove -y && sudo snap refresh'

# docker
alias dcu='docker compose up -d'
alias dcd='docker compose down'
alias dps='docker ps -a'
alias dcs='docker compose stop'

# git
alias gst='git status'
alias ga='git add'
alias gc='git commit'
alias gd='git diff'
alias gp='git push'

# https://github.com/uker-troi-lab/commit_hooks
alias bmp='pre-commit run --hook-stage post-commit bump-version'
EOF

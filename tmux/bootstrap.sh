#!/usr/bin/env sh

if ! brew list tmux > /dev/null 2>&1; then
  brew install tmux
fi

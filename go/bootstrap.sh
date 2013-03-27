#!/usr/bin/env sh

if ! brew list go > /dev/null 2>&1; then
  brew install go
fi

# create the GOPATH directory
mkdir -p $HOME/.go

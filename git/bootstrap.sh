#!/usr/bin/env sh

if ! brew list git > /dev/null 2>&1; then
  brew install git
fi

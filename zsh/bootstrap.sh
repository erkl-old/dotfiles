#!/usr/bin/env sh

if ! brew list zsh > /dev/null 2>&1; then
  brew install --disable-etcdir zsh
fi

# make sure homebrew's zsh is registered as a valid shell
if ! grep -q "^/usr/local/bin/zsh$" /etc/shells; then
  sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
fi

# change the current user's default shell
sudo chsh -s '/usr/local/bin/zsh' $(whoami) > /dev/null 2>&1

#!/usr/bin/env sh

brew install --disable-etcdir zsh

# make sure homebrew's zsh is registered as a valid shell
if ! grep -q "^/usr/local/bin/zsh$" /etc/shells; then
  sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
fi

# change the current user's default shell
sudo chsh -s "/usr/local/bin/zsh" $(whoami)

#!/usr/bin/env sh

export DOTFILES="$HOME/.dotfiles"

if ! sudo -v; then
  echo "error: sudo -v failed"
  exit 1
fi

# make sure homebrew is installed
if ! brew --version 2>&1 1>/dev/null; then
  ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
  brew doctor

  # make sure executables in /usr/local/bin are found before
  # the system defaults
  OTHER=$(grep -v "/usr/local/bin" "/etc/paths")
  sudo sh -c "printf \"/usr/local/bin\n$OTHER\n\" > \"/etc/paths\""
fi

# upgrade homebrew formulae
brew update > /dev/null
brew upgrade

# link */name.symlink to ~/.name
for symlink in $(find $DOTFILES/*/*.symlink 2>/dev/null); do
  name=$(basename "$symlink" | sed "s/\.symlink$//g")

  rm -f "$HOME/.$name"
  ln -s "$symlink" "$HOME/.$name"
done

# bootstrap each module individually
for file in $(find */bootstrap.sh 2>/dev/null); do
  sh "$PWD/$file"
done

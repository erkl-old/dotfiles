#!/usr/bin/env sh

PACKAGES="$HOME/Library/Application Support/Sublime Text 2/Packages"

# put our own files in Package/User
mkdir -p "$PACKAGES"
rm -rf "$PACKAGES/User"
ln -s "$DOTFILES/sublime2/packages" "$PACKAGES/User"

# install the soda theme
echo git clone git://github.com/buymeasoda/soda-theme.git "$PACKAGES/Theme - Soda"

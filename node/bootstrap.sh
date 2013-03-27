#!/usr/bin/env sh

# fetch the latest version of nave
curl -fsSL -o "/usr/local/bin/nave" https://raw.github.com/isaacs/nave/master/nave.sh
chmod +x "/usr/local/bin/nave"

# install the latest stable version of node
nave usemain stable > /dev/null 2>&1

#!/usr/bin/env sh

if [ -z $1 ]; then
  echo "Usage: hostname.sh <hostname>"
  exit 1
fi

sudo sh <<BASH
  scutil --set ComputerName "$1" &&
  scutil --set HostName "$1" &&
  scutil --set LocalHostName "$1" &&
  defaults write \
    '/Library/Preferences/SystemConfiguration/com.apple.smb.server' \
    NetBIOSName -string "$1"
BASH

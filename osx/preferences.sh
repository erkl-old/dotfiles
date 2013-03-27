#!/usr/bin/env sh

# Automatic OS X configuration, inspired by Mathias Bynens.
# https://github.com/mathiasbynens/dotfiles/blob/master/.osx

# disable system/application resume
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

# never terminate inactive applications
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

# restart automatically if the computer freezes
systemsetup -setrestartfreeze on

# never sleep without user intervention
systemsetup -setcomputersleep Off > /dev/null

# check for software updates daily instead of once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# stop Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# disable local Time Machine backups
hash tmutil &> /dev/null && sudo tmutil disablelocal

# rearrange the icons in the menu bar
defaults write com.apple.systemuiserver menuExtras -array \
  "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
  "/System/Library/CoreServices/Menu Extras/AirPort.menu" \
  "/System/Library/CoreServices/Menu Extras/Battery.menu" \
  "/System/Library/CoreServices/Menu Extras/Clock.menu"

# display battery percentage
defaults write com.apple.menuextra.battery ShowPercent -string "NO"

# speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.15

# always expand save modals
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# set the icon size of Dock items to 30 pixels
defaults write com.apple.dock tilesize -int 30

# don’t show the Dashboard as a Space
defaults write com.apple.dock dashboard-in-overlay -bool true

# enable full keyboard access for all interface elements
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# disable press-and-hold for keys
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# set a blazingly fast key repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# don't turn the keyboard backlight on automatically
defaults write com.apple.BezelServices kDim -bool false

# disable auto-correction
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# save screenshots to the desktop, in PNG format
defaults write com.apple.screencapture location -string "$HOME/Desktop"
defaults write com.apple.screencapture type -string "png"

# enable subpixel font rendering on non-Apple LCDs
defaults write NSGlobalDomain AppleFontSmoothing -int 2

# disable the warning shown before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# empty Trash securely by default
defaults write com.apple.finder EmptyTrashSecurely -bool true

# unhide the ~/Library folder
chflags nohidden ~/Library

# use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

# use list view in all Finder windows by default
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# show hidden files
defaults write com.apple.finder AppleShowAllFiles true

# display all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# disable Finder window and "Get Info" pane animations
defaults write com.apple.finder DisableAllAnimations -bool true

# show icons for servers and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# display the full POSIX path as the Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# perform searches in the current folder
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# never create .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

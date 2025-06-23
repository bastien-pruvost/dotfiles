# Dotfiles

This repository is managed with [chezmoi](https://github.com/twpayne/chezmoi) and contains configuration files for my development environment.

> [!NOTE]
> My dev environment is focused on web, mobile and software development, it suits my needs and preferences.
> You can use this repository as a reference or as a starting point for your own dotfiles.
> It's up to you to decide what you want to keep or remove and make the necessary adjustments to suit your needs.

# Installation guide

## Introduction

This README is an opinionated guide to install a clean MacOS development environment.

Follow the steps of this guide in the right order to ensure the installation goes as smoothly as possible.

> [!IMPORTANT]
> Everytime you are prompted to setup a passphrase or password, make sure to use a strong and secure one and store it in a secure place.
> Password managers are a good option to generate and store secure passwords.

## Prerequisites

1. Set the Mac name
   - In _Setting > General > About > Name_
   - In _Settings > General > Sharing > Local hostname_
   - In Terminal:
     - `sudo scutil --set ComputerName "john-mbp"`
     - `sudo scutil --set LocalHostName "john-mbp"`
     - `sudo scutil --set HostName "john-mbp"`
2. Setup an internet connection (Wi-Fi or Ethernet)
3. Set User informations and password
   - In _Settings > Users & Groups_
   - In _Settings > [Your Name] Apple ID_
4. Update MacOS version to latest stable (⚠️ Don’t update if the latest macOS version is too recent or not yet stable):
   - In Terminal:
     - `softwareupdate --install --recommended --restart`

## MacOS settings

### System settings (via GUI)

- Appearance
  - Light Mode
  - Show Scroll Bars -> "Always"
- Dock

  - Remove all applications from Dock
  - Automatic Hide
  - Smaller Dock
  - "Show recent applications in Dock" -> off
  - "Show indicators for open applications" -> on
  - Battery -> "Show Percentage"

- Display
  - Nightshift
- Security
  - Touch ID
- Notifications
  - Off, except for Calendar
- Siri
  - Disabled
- Trackpad
  - Tap to Click
  - Point & Click -> Look up & data detectors off
  - More Gestures -> Notification Centre off
- Keyboard
  - Text
    - disable "Capitalise word automatically"
    - disable "Add full stop with double-space"
    - disable "Use smart quotes and dashes"
    - use `"` for double quotes
    - use `'` for single quotes
  - Keyboard -> Mission Control -> disable all
  - Press FN to -> "Do Nothing"
  - Keyboard Shortcuts -> Spotlight -> CMD + Space disable
    - We will be using Raycast instead
- Mission Control
  - Hot Corners: disable all
- Finder
  - General
    - New Finder windows show: [Downloads]
    - Show these items on the desktop: disable all
  - Sidebar:
    - activate all Favorites
    - move Library to Favorites
  - Show only:
    - Desktop
    - Downloads
    - Documents
    - [User]
    - Library
  - Tags
    - disable all
  - Advanced
    - Show all Filename Extensions
    - Remove Items from Bin after 30 Days
    - View -> Show Preview (e.g. image files)
- Sharing
  - "Change computer name"
  - "Make sure all file sharing is disabled"
- Security and Privacy
  - Turn on FileVault
  - Add Browser to "Screen Recording"
- Storage
  - Remove Garage Band & Sound Library
  - Remove iMovie
- Trackpad
  - Speed: Max
- Accessibility
  - Scroll Speed: Max

### System settings (via Terminal)

Some settings are only available via command line:

```bash
# Show Library folder
chflags nohidden ~/Library

# Show hidden files
defaults write com.apple.finder AppleShowAllFiles YES

# Show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Shorter Dock autohide animation duration
defaults write com.apple.dock "autohide-time-modifier" -float "0.3"

# Remove the Dock autohide delay
defaults write com.apple.dock "autohide-delay" -float "0"

# Enable "Group windows by application in Mission Control" (better for Aerospace tilling window management)
defaults write com.apple.dock expose-group-apps -bool true

# Disable "Displays have separate Spaces" (better for Aerospace tilling window management)
defaults write com.apple.spaces spans-displays -bool false

# Enable dragging windows from anywhere with Ctrl + Cmd + Drag (better for Aerospace tilling window management)
defaults write -g NSWindowShouldDragOnGesture -bool true

# Disable window animations (better for Aerospace tilling window management)
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false

# Disable mouse acceleration
defaults write NSGlobalDomain com.apple.mouse.linear -bool true

# Take screenshots as jpg (usually smaller size) and not png
defaults write com.apple.screencapture type jpg

# Do not open previous previewed files (e.g. PDFs) when opening a new one
defaults write com.apple.Preview ApplePersistenceIgnoreState YES

# Disable rich text by default for TextEdit
defaults write com.apple.TextEdit "RichText" -bool "false" && killall TextEdit

# Restart Finder and Dock
killall SystemUIServer;
killall Finder;
killall Dock;
```

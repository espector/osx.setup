#!/bin/bash
#how to upgrade brew cask application
#brew cask install dropbox --force --download
#download ann install homebrew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

#install command line utilities
brew install ffmpeg
brew install highlight
brew install imagemagick
brew install phantomjs
brew install wget

#install cask
brew tap caskroom/cask
brew install caskroom/cask/brew-cask

#install browsers
brew cask install google-chrome
brew cask install firefox

#install cloud services
brew cask install dropbox
brew cask install google-drive
brew cask install evernote
brew cask install skitch
brew cask install amazon-music

#install misc applications
brew cask install adobe-reader
brew cask install caffeine
brew cask install cyberduck
brew cask install deluge
brew cask install mucommander
brew cask install pdfsam
brew cask install picasa

#install media tools
brew cask install calibre
brew cask install handbrake
brew cask install vlc

#install dev tools
brew cask install sublime-text
brew cask install sequel-pro
brew cask install xquartz
brew cask install virtualbox
brew cask install vagrant
brew cask install wineskin-winery

#misc apps
brew cask install joinme
brew cask install logitech-myharmony

#remove downloaded files
brew cask cleanup
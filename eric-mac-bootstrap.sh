#!/bin/bash
#
# By Eric Spector 
#
# note:  how to upgrade brew cask application
# unfortunately brew cask doesn't support app update, so you'll need to re-download by running the following command:
# brew cask install <appname> --force --download

#download and install homebrew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

#install command line utilities
brew install ffmpeg
brew install highlight
brew install imagemagick
brew install phantomjs
brew install wget

#install powerline per - http://blog.codefront.net/2013/10/27/installing-powerline-on-os-x-homebrew/
brew install python
brew install vim --env-std --override-system-vim
pip install https://github.com/Lokaltog/powerline/tarball/develop

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
brew cask install colloquy
brew cask install cyberduck
brew cask install deluge
brew cask install joinme
brew cask install logitech-myharmony
brew cask install mucommander
brew cask install pdfsam
brew cask install picasa

#install media tools
brew cask install calibre
brew cask install handbrake
brew cask install vlc

#install dev tools
brew cask install github
brew cask install sublime-text
brew cask install sequel-pro
brew cask install xquartz
brew cask install virtualbox
brew cask install vagrant
brew cask install wineskin-winery

#remove downloaded files
brew cask cleanup

#copy config files
cp files/vim/.vimrc ~/
cp files/zsh/.zshrc ~/
cp files/tmux/.tmux.conf ~/
cp files/bash/.bash_profile ~/

#install powerline fonts
wget https://raw.githubusercontent.com/Lokaltog/powerline-fonts/master/Inconsolata/Inconsolata%20for%20Powerline.otf --directory-prefix=/tmp/
open "/tmp/Inconsolata for Powerline.otf"

wget https://raw.githubusercontent.com/Lokaltog/powerline-fonts/master/SourceCodePro/Sauce%20Code%20Powerline%20Regular.otf --directory-prefix=/tmp/
open "/tmp/Sauce Code Powerline Regular.otf"

osascript -e 'tell app "System Events" to display dialog "Remember to set your Terminal or font to Inconsolata for Powerline or Sauce Code for PowerLine"'
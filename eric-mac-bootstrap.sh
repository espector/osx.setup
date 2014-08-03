#!/bin/bash
#
# By Eric Spector 
#
# note:  how to upgrade brew cask application
# unfortunately brew cask doesn't support app update, so you'll need to re-download by running the following command:
# brew cask install <appname> --force --download

#update gems
sudo gem update --system

#install xcode command line tools
xcode-select --install

#download and install homebrew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew doctor

#install command line utilities
brew install ffmpeg
brew install highlight
brew install imagemagick
brew install phantomjs
brew install wget
brew install python
brew install vim --env-std --override-system-vim

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
brew cask install fluid
brew cask install flux
brew cask install joinme
brew cask install logitech-myharmony
brew cask install mame 
brew cask install mucommander
brew cask install openemu
brew cask install pdfsam
brew cask install picasa
brew cask install the-unarchiver

#install media tools
brew cask install calibre
brew cask install handbrake
brew cask install vlc

#install dev tools
brew cask install dash
brew cask install github
brew cask install iterm2
brew cask install sublime-text
brew cask install sequel-pro
brew cask install xquartz
brew cask install virtualbox
brew cask install vagrant
brew cask install wineskin-winery

brew install ios-sim

#remove downloaded files
brew cask cleanup

#install zsh as default shell
brew install zsh
brew install zsh-completions
brew install zsh-syntax-highlighting
sudo -s -- "echo /usr/local/bin/zsh >> /etc/shells"
chsh -s /usr/local/bin/zsh
#install ohmyzsh
curl -L http://install.ohmyz.sh | sh

#copy config files
cp files/zsh/.zshrc ~/

#install vim awesome - per https://github.com/amix/vimrc
git clone git://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_basic_vimrc.sh
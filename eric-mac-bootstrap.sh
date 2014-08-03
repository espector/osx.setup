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

#install brew packages
brew bundle Brewinstall

#install brew cask packages
brew bundle Caskinstall

#remove downloaded files
brew cask cleanup

#install ohmyzsh
sudo -s -- "echo /usr/local/bin/zsh >> /etc/shells"
chsh -s /usr/local/bin/zsh
#install ohmyzsh
curl -L http://install.ohmyz.sh | sh

#copy config files
cp files/zsh/.zshrc ~/

#install vim awesome - per https://github.com/amix/vimrc
git clone git://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_basic_vimrc.sh
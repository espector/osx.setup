#!/bin/bash
brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup
brew install `brew outdated`

#update cask
for c in `brew cask list`; do ! brew cask info $c | grep -qF "Not installed" || brew cask install $c; done

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

###############################################################################
# Terminal                                                                    #
###############################################################################

#setup solarized theme in the terminal
git clone git://github.com/altercation/solarized.git ~/.solarized

# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

# Use a modified version of the Solarized Dark theme by default in Terminal.app
TERM_PROFILE='Solarized Dark xterm-256color';
CURRENT_PROFILE="$(defaults read com.apple.terminal 'Default Window Settings')"
if [ "${CURRENT_PROFILE}" != "${TERM_PROFILE}" ]; then
	open "${HOME}/.solarized/osx-terminal.app-colors-solarized/xterm-256color.terminal";
	sleep 1; # Wait a bit to make sure the theme is loaded
	defaults write com.apple.terminal 'Default Window Settings' -string "${TERM_PROFILE}";
	defaults write com.apple.terminal 'Startup Window Settings' -string "${TERM_PROFILE}";
fi;

###############################################################################
# Mac App Store                                                               #
###############################################################################

# Enable the WebKit Developer Tools in the Mac App Store
defaults write com.apple.appstore WebKitDeveloperExtras -bool true

# Enable Debug Menu in the Mac App Store
defaults write com.apple.appstore ShowDebugMenu -bool true

###############################################################################
# Safari & WebKit                                                             #
###############################################################################

# Set Safari’s home page to `about:blank` for faster loading
defaults write com.apple.Safari HomePage -string "about:blank"

# Prevent Safari from opening ‘safe’ files automatically after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Allow hitting the Backspace key to go to the previous page in history
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true

# Hide Safari’s bookmarks bar by default
defaults write com.apple.Safari ShowFavoritesBar -bool false

# Hide Safari’s sidebar in Top Sites
defaults write com.apple.Safari ShowSidebarInTopSites -bool false

# Disable Safari’s thumbnail cache for History and Top Sites
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

# Enable Safari’s debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Make Safari’s search banners default to Contains instead of Starts With
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

# Remove useless icons from Safari’s bookmarks bar
defaults write com.apple.Safari ProxiesInBookmarksBar "()"

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true



# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true



#finder
# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"


# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0
# Open and save files as UTF-8 in TextEdit
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4
echo "Creating an SSH key for you..."
ssh-keygen -t rsa

echo "Please add this public key to Github \n"
echo "https://github.com/account/ssh \n"
read -p "Press [Enter] key after this..."

echo "Installing xcode-stuff"
xcode-select --install

# Check for homebrew
# Install if we don't have it
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

echo "Installing Git..."
brew install git

#echo "Copying dotfiles from Github"
#cd ~
#git clone --recursive git@github.com:bradp/dotfiles.git
#rake

echo "Git config"
echo "user name?"
read gitusername
git config --global user.name "$gitusername"
echo "user email?"
read gituseremail
git config --global user.email "$gituseremail"

echo "Installing brew git utilities..."
brew install git-extras
brew install legit
brew install git-flow

echo "Installing other brew stuff..."
brew install tree
brew install wget
brew install mackup
brew install node

echo "Installing Docker..."
#brew install --cask docker

echo "Cleaning up brew"
brew cleanup

echo "Upgrading brew"
brew upgrade

echo "Grunting it up"
npm install -g grunt-cli

# Install zsh & Oh My Zsh
echo "Installing Oh My ZSH..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#echo "Setting up Oh My Zsh theme..."
#cd  /Users/crawling/.oh-my-zsh/themes
#curl https://raw.githubusercontent.com/pedromiba/macsetup/master/theme.zsh-theme > ~/.oh-my-zsh/themes/brad-muse.zsh-theme

echo "Setting up Zsh plugins..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "Setting ZSH as shell..."
chsh -s /bin/zsh

echo "Setting up bash_aliases..."
cd  ~
curl https://raw.githubusercontent.com/pedromiba/macsetup/master/bash_aliases > ~/.bash_aliases

# Apps
apps=(
    google-chrome
    iterm2
    visual-studio-code
    vlc
    skype
    sequel-pro
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps with Cask..."
brew install --cask --appdir="/Applications" ${apps[@]} --force

read -p "Do you want to install 1Password? (y/n) " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    brew install --cask 1password
fi

read -p "Do you want to install Spotify? (y/n) " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    brew install --cask spotify
fi

read -p "Do you want to install Alfred? (y/n) " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    brew install --cask alfred
fi

brew cleanup

echo "Setting some Mac settings..."

#"Disabling system-wide resume"
# defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

# #"Disabling automatic termination of inactive apps"
# # defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

# #"Allow text selection in Quick Look"
# defaults write com.apple.finder QLEnableTextSelection -bool true

# #"Disabling OS X Gate Keeper"
# #"(You'll be able to install any app you want from here on, not just Mac App Store apps)"
# sudo spctl --master-disable
# sudo defaults write /var/db/SystemPolicy-prefs.plist enabled -string no
# defaults write com.apple.LaunchServices LSQuarantine -bool false

# #"Expanding the save panel by default"
# defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
# defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
# defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# #"Automatically quit printer app once the print jobs complete"
# defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# #"Saving to disk (not to iCloud) by default"
# defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# #"Check for software updates daily, not just once per week"
# defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# #"Disable smart quotes and smart dashes as they are annoying when typing code"
# defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
# defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# #"Enabling full keyboard access for all controls (e.g. enable Tab in modal dialogs)"
# defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# #"Enabling subpixel font rendering on non-Apple LCDs"
# defaults write NSGlobalDomain AppleFontSmoothing -int 2

# #"Showing icons for hard drives, servers, and removable media on the desktop"
# defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true

# #"Showing all filename extensions in Finder by default"
# defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# #"Disabling the warning when changing a file extension"
# defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# #"Use column view in all Finder windows by default"
# defaults write com.apple.finder FXPreferredViewStyle Clmv

# #"Avoiding the creation of .DS_Store files on network volumes"
# defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# #"Enabling snap-to-grid for icons on the desktop and in other icon views"
# /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# #"Setting the icon size of Dock items to 36 pixels for optimal size/screen-realestate"
# defaults write com.apple.dock tilesize -int 36

# #"Speeding up Mission Control animations and grouping windows by application"
# defaults write com.apple.dock expose-animation-duration -float 0.1
# defaults write com.apple.dock "expose-group-by-app" -bool true

# #"Setting Dock to auto-hide and removing the auto-hiding delay"
# defaults write com.apple.dock autohide -bool true
# defaults write com.apple.dock autohide-delay -float 0
# defaults write com.apple.dock autohide-time-modifier -float 0

# #"Setting email addresses to copy as 'foo@example.com' instead of 'Foo Bar <foo@example.com>' in Mail.app"
# defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# #"Enabling UTF-8 ONLY in Terminal.app and setting the Pro theme by default"
# defaults write com.apple.terminal StringEncodings -array 4
# defaults write com.apple.Terminal "Default Window Settings" -string "Pro"
# defaults write com.apple.Terminal "Startup Window Settings" -string "Pro"

# #"Preventing Time Machine from prompting to use new hard drives as backup volume"
# defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# #"Disable the sudden motion sensor as its not useful for SSDs"
# sudo pmset -a sms 0

# #"Speeding up wake from sleep to 24 hours from an hour"
# # http://www.cultofmac.com/221392/quick-hack-speeds-up-retina-macbooks-wake-from-sleep-os-x-tips/
# sudo pmset -a standbydelay 86400

# #"Disable annoying backswipe in Chrome"
# defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool true

# #"Setting screenshots location to ~/Desktop"
# defaults write com.apple.screencapture location -string "$HOME/Desktop"

# #"Setting screenshot format to PNG"
# defaults write com.apple.screencapture type -string "png"

# #"Hiding Safari's bookmarks bar by default"
# defaults write com.apple.Safari ShowFavoritesBar -bool false

# #"Hiding Safari's sidebar in Top Sites"
# defaults write com.apple.Safari ShowSidebarInTopSites -bool false

# #"Disabling Safari's thumbnail cache for History and Top Sites"
# defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

# #"Enabling Safari's debug menu"
# defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# #"Making Safari's search banners default to Contains instead of Starts With"
# defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

# #"Removing useless icons from Safari's bookmarks bar"
# defaults write com.apple.Safari ProxiesInBookmarksBar "()"

# #"Allow hitting the Backspace key to go to the previous page in history"
# defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true

# #"Enabling the Develop menu and the Web Inspector in Safari"
# defaults write com.apple.Safari IncludeDevelopMenu -bool true
# defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
# defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true

# #"Adding a context menu item for showing the Web Inspector in web views"
# defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# #"Disable 'natural' (Lion-style) scrolling"
# defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true

# # Don’t automatically rearrange Spaces based on most recent use
# defaults write com.apple.dock mru-spaces -bool false

killall Finder

echo "Running Doctor"
brew Doctor

echo "Done! Please close your terminal to refresh the new settings"
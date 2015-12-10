#!/bin/bash
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask
brew install brew-cask
brew tap caskroom/versions
brew install curl
brew install git
brew install node
brew install python
brew install vagrant
brew install vim
brew install wget
brew cask install dropbox
brew cask install firefox
brew cask install google-chrome
brew cask install iterm2
brew cask install sublime-text3
brew cask install virtualbox
brew cask install vlc

pip install ipython
pip install powerline-status

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# Sync Sublime Text 3 configuration
rm -r ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
ln -s ~/Dropbox/Sublime/User ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User

ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl ~/bin/subl
echo "You probably want to press Ctrl+` in Sublime Text and then run this:"
echo "import urllib.request,os,hashlib; h = '2915d1851351e5ee549c20394736b442' + '8bc59f460fa1548d1514676163dafc88'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)"

ln -s "./.bashrc" ~
ln -s "./.tmux.conf" ~
ln -s "./.vimrc" ~

mkdir ~/.ssh
cat ./id_rsa.pub >> ~/.ssh/authorized_keys

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=” “

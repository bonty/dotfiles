#!/bin/sh

#
# YOU DO NOT NEED TO INVOKE THIS SCRIPT SUDO.
#

export PATH=/usr/local/bin:$PATH
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

CURRENT_DIR=`dirname $0`

cd $CURRENT_DIR

xcode-select --install

# install homebrew if not installed
if [ ! `which brew` ]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew tap Homebrew/brewdler

# install software with homebrew
brew bundle

# this is required emacs compiling flycheck
brew link --force texinfo

# setup with shell scripts
find $CURRENT_DIR/setups -name "*.sh" | xargs -I S sh S

yes | /usr/local/bin/mackup restore

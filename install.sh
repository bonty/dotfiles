#!/bin/sh

export HOMEBREW_CASK_OPTS="--appdir=/Applications --caskroom=/usr/local/Caskroom"

CURRENT_DIR=`dirname $0`

cd $CURRENT_DIR

# install homebrew if not installed
if [ ! `which brew` ]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew tap Homebrew/brewdler

# install software with homebrew
brew bundle

# setup with shell scripts
find $CURRENT_DIR/setups -name "*.sh" | xargs -I S sh S

#!/bin/sh

# install 2.1.1
rbenv install 2.1.1
rbenv global 2.1.1
rbenv rehash

# install homesick
rbenv exec gem install homesick
rbenv rehash

# setup homesick
rbenv exec homesick clone bonty/dotfiles
rbenv exec homesick pull dotfiles
yes | rbenv exec homesick symlink dotfiles

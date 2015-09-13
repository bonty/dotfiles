#!/bin/sh

rbenv install 2.2.3
rbenv global 2.2.3
rbenv rehash

rbenv exec gem install homesick
rbenv rehash

# setup homesick
rbenv exec homesick clone bonty/dotfiles
rbenv exec homesick pull dotfiles
yes | rbenv exec homesick symlink dotfiles

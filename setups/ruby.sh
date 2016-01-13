#!/bin/sh

rbenv install 2.2.3
rbenv global 2.2.3
rbenv rehash

rbenv exec gem install bundler
rbenv exec gem install homesick
rbenv exec gem install ec2ssh
rbenv rehash

# setup homesick
rbenv exec homesick clone bonty/dotfiles
rbenv exec homesick pull dotfiles
yes | rbenv exec homesick symlink dotfiles

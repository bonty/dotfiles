#!/bin/sh

if [ ! -d ~/Library/LaunchAgents ]; then
    mkdir ~/Library/LaunchAgents
fi

ln -sfv $(brew --prefix)/opt/memcached/*.plist ~/Library/LaunchAgents/
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.memcached.plist

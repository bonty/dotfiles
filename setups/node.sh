#!/bin/sh

if [ ! -d ~/.nodebrew/src ]; then
    mkdir -p ~/.nodebrew/src
fi

nodebrew install-binary v5.11.0
nodebrew use v5.11.0

npm install -g diff-so-fancy

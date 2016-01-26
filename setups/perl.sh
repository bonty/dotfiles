#!/bin/sh

plenv install 5.18.4
plenv global 5.18.4
plenv rehash

plenv install-cpanm

# TODO: use carton
plenv exec cpanm App::dropboxapi

plenv rehash

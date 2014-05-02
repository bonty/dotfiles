#!/bin/sh

# install 2.7.6
pyenv install 2.7.6
pyenv global 2.7.6
pyenv rehash && rehash

# install percol
pyenv exec pip install percol

# install awscli
pyenv exec pip install awscli

pyenv rehash











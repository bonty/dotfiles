#!/bin/sh

pyenv install 2.7.8
pyenv global 2.7.8
pyenv rehash

pyenv exec pip install percol --allow-external percol --allow-unverified percol
pyenv exec pip install awscli
pyenv exec pip install pygments
pyenv exec pip install boto

pyenv rehash

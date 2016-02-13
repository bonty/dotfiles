#!/bin/sh

pyenv install 2.7.11
pyenv global 2.7.11
pyenv rehash

# TODO: use requirements.txt
# pyenv exec pip install -r requirements.txt
pyenv exec pip install pygments
pyenv exec pip install awscli
pyenv exec pip install awsebcli
pyenv exec pip install boto

pyenv rehash

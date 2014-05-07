#!/bin/sh

# chsh
path_zsh=$(find $(brew --prefix)/bin -name zsh)
if [ -n ${path_zsh} -a $SHELL != ${path_sh} ]; then
    echo ${path_zsh} | sudo tee -a /etc/shells
    chsh -s ${path_zsh}
fi

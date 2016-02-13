# setting for rbenv
eval "$(rbenv init - --no-rehash)"

# setting for plenv
eval "$(plenv init - --no-rehash)"

# setting for pyenv
eval "$(pyenv init - --no-rehash)"

# direnv
eval "$(direnv hook zsh)"

# z.sh
. /usr/local/etc/profile.d/z.sh
function precmd () {
    z --add "$(pwd -P)"
}

# homebrew-file
# @see: http://rcmdnk.github.io/blog/2015/06/30/computer-mac-brew-file-homebrew/
if [ -f /usr/local/etc/brew-wrap ]; then
    source /usr/local/etc/brew-wrap
fi

# added by travis gem
if [ -f $HOME/.travis/travis.sh ]; then
    source $HOME/.travis/travis.sh
fi

# added by google cloud sdk installed by homebrew
if [ -f /opt/homebrew-cask/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc ]; then
    source /opt/homebrew-cask/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc
fi

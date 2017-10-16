# setting for rbenv
eval "$(rbenv init - --no-rehash)"

# setting for ndenv
eval "$(ndenv init - --no-rehash)"

# setting for plenv
eval "$(plenv init - --no-rehash)"

# setting for pyenv
eval "$(pyenv init - --no-rehash)"

# direnv
eval "$(direnv hook zsh)"

# z.sh
_Z_CMD=j
load-if-exists /usr/local/etc/profile.d/z.sh
test $? || unset _Z_CMD

# homebrew-file
# @see: http://rcmdnk.github.io/blog/2015/06/30/computer-mac-brew-file-homebrew/
load-if-exists /usr/local/etc/brew-wrap

# added by travis gem
load-if-exists $HOME/.travis/travis.sh

# added by google cloud sdk installed by homebrew
load-if-exists /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc

# .zshrc

source ~/.zsh.d/zplug

# zshおすすめ設定
# @see http://www.clear-code.com/blog/2011/9/5.html
source ~/.zsh.d/zshrc

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

# added by google cloud sdk installed by homebrew
[ -f /opt/homebrew-cask/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc ] && source /opt/homebrew-cask/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc

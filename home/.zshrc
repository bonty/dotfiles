# .zshrc

source ~/.zsh.d/zshantigen

# zshおすすめ設定
# @see http://www.clear-code.com/blog/2011/9/5.html
source ~/.zsh.d/zshrc

source ~/.zsh.d/zshfunction

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=${HOME}/src/cocos2d-x/tools/cocos2d-console/bin
export COCOS_TEMPLATES_ROOT=${HOME}/src/cocos2d-x/templates
export PATH=$COCOS_CONSOLE_ROOT:$COCOS_TEMPLATES_ROOT:$PATH

# added by google cloud sdk installed by homebrew
[ -f /opt/homebrew-cask/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc ] && source /opt/homebrew-cask/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc

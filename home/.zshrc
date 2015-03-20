# .zshrc

source ~/.zsh.d/zshantigen

# zshおすすめ設定
# @see http://www.clear-code.com/blog/2011/9/5.html
source ~/.zsh.d/zshrc

source ~/.zsh.d/zshfunction

# added by travis gem
[ -f /Users/hkouno/.travis/travis.sh ] && source /Users/hkouno/.travis/travis.sh

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT=/Users/hkouno/src/cocos2d-x/templates
export PATH=$COCOS_TEMPLATES_ROOT:$PATH

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

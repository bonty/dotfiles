#
# .zshrc
#

umask 022
limit coredumpsize 0

autoload -Uz add-zsh-hook
autoload -Uz cdr
autoload -Uz colors; colors
autoload -Uz compinit; compinit -u
autoload -Uz history-search-end
autoload -Uz modify-current-argument
autoload -Uz smart-insert-last-word
autoload -Uz zcalc
autoload -Uz zmv

zsh_zplug() {
    if [ ! -e ~/.zplug/zplug ]; then
        curl -fLo ~/.zplug/zplug --create-dirs git.io/zplug
    fi

    source ~/.zplug/zplug

    zplug "b4b4r07/zplug"

    zplug "~/.zsh.d", from:local

    # zplug "plugins/brew",       from:oh-my-zsh
    # zplug "plugins/bundler",    from:oh-my-zsh
    # zplug "plugins/capistrano", from:oh-my-zsh
    # zplug "plugins/gem",        from:oh-my-zsh
    # zplug "plugins/git-flow",   from:oh-my-zsh
    # zplug "plugins/git",        from:oh-my-zsh
    # zplug "plugins/github",     from:oh-my-zsh
    # zplug "plugins/fast",       from:oh-my-zsh
    # zplug "plugins/osx",        from:oh-my-zsh
    # zplug "plugins/rails",      from:oh-my-zsh
    # zplug "plugins/rake",       from:oh-my-zsh
    # zplug "plugins/rbenv",      from:oh-my-zsh

    zplug "b4b4r07/enhancd", of:enhancd.sh
    zplug "glidenote/hub-zsh-completion"

    zplug "zsh-users/zsh-completions"
    zplug "zsh-users/zsh-syntax-highlighting", nice: 19
    zplug "zsh-users/zsh-history-substring-search"

    # pure theme
    zplug "mafredri/zsh-async"
    zplug "sindresorhus/pure"

    if ! zplug check; then
        zplug install
    fi

    zplug load
}

zsh_zplug

zstyle ':completion:*:default' menu select=2

zstyle ':completion:*' format '%B%d%b'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'
zstyle ':completion:*' group-name ''

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} r:|[._-]=*'
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*' use-cache true

zstyle ':completion:*:cd:*' ignore-parents parent pwd
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:manuals' separate-sections true

zstyle ':completion:sudo:*' environ PATH="$SUDO_PATH:$PATH"

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

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

if [ ! -e ~/.zplug/zplug ]; then
    curl -fLo ~/.zplug/zplug --create-dirs git.io/zplug
fi

source ~/.zplug/zplug

zplug "b4b4r07/zplug"

zplug "~/.zsh.d", from:local

zplug "plugins/brew",       from:oh-my-zsh
zplug "plugins/bundler",    from:oh-my-zsh
zplug "plugins/gem",        from:oh-my-zsh
zplug "plugins/git-flow",   from:oh-my-zsh
zplug "plugins/git",        from:oh-my-zsh
zplug "plugins/github",     from:oh-my-zsh
zplug "plugins/rails",      from:oh-my-zsh
zplug "plugins/rake",       from:oh-my-zsh
zplug "plugins/rbenv",      from:oh-my-zsh

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

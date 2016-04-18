#
# .zshrc
#

umask 022
limit coredumpsize 0

autoload -Uz add-zsh-hook
autoload -Uz cdr
autoload -Uz colors; colors
autoload -Uz compinit
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

    zplug "plugins/brew",       from:oh-my-zsh
    zplug "plugins/bundler",    from:oh-my-zsh
    zplug "plugins/gem",        from:oh-my-zsh
    zplug "plugins/git-flow",   from:oh-my-zsh
    zplug "plugins/git",        from:oh-my-zsh
    zplug "plugins/github",     from:oh-my-zsh
    zplug "plugins/rails",      from:oh-my-zsh
    zplug "plugins/rake",       from:oh-my-zsh
    zplug "plugins/rbenv",      from:oh-my-zsh

    # zplug "b4b4r07/enhancd", of:enhancd.sh
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

tmux_auto_attach() {
    [ ! -z "$TMUX" ] && return

    if ! which "tmux" > /dev/null; then
        echo "tmux not found" 1>&2
        exit 1
    fi

    if tmux has-session >/dev/null 2>&1 && tmux list-sessions | grep -qE '.*]$'; then
        # detached session exists
        tmux list-sessions | perl -pe 's/(^.*?):/\033[31m$1:\033[m/'
        echo -n "Tmux: attach? (y/N num/session-name) "
        read
        if [[ "$REPLY" =~ ^[Yy]$ ]] || [[ "$REPLY" == '' ]]; then
            tmux attach-session
            if [ $? -eq 0 ]; then
                echo "$(tmux -V) attached session"
                exit
            fi
        elif tmux list-sessions | grep -q "^$REPLY:"; then
            tmux attach -t "$REPLY"
            if [ $? -eq 0 ]; then
                echo "$(tmux -V) attached session"
                exit
            fi
        fi
    fi

    tmux new-session && echo "tmux created new session"
}

tmux_auto_attach
zsh_zplug

# has_command returns true if $1 as a shell command exists
has.command() {
    (( $+commands[${1:?too few argument}] ))
    return $status
}

# has_command returns true if $1 as a shell function exists
has.function() {
    (( $+functions[${1:?too few argument}] ))
    return $status
}

# has_command returns true if $1 as a builtin command exists
has.builtin() {
    (( $+builtins[${1:?too few argument}] ))
    return $status
}

# has_command returns true if $1 as an alias exists
has.alias() {
    (( $+aliases[${1:?too few argument}] ))
    return $status
}

# has_command returns true if $1 as an alias exists
has.galias() {
    (( $+galiases[${1:?too few argument}] ))
    return $status
}

# has returns true if $1 exists
has() {
    has.function "$1" || \
        has.command "$1" || \
        has.builtin "$1" || \
        has.alias "$1" || \
        has.galias "$1"

    return $status
}


# screen/tmuxでタイトルにコマンドとホスト名を表示
if [ ${TERM%%-*} = screen ]; then
    local -a shorthost
    echo $TERMCAP | grep -q -i screen
    if [ $? -eq 0 ]; then
        shorthost=""
    else
        shorthost="${HOST%%.*}"
    fi

    preexec() {
        if [ "$shorthost" = "" ]; then
            echo -ne "\ek${1%% *}\e\\"
        else
            echo -ne "\ek${1%% *}@${shorthost}\e\\"
        fi
    }

    precmd() {
        if [ "$shorthost" = "" ]; then
            echo -ne "\ek$(basename $(print -P %~))\e\\"
        else
            echo -ne "\ek$(basename $(print -P %~))@${shorthost}\e\\"
        fi
    }
fi

function exists() {
    type $1 > /dev/null 2>&1
}

# source-highlightでlvをsyntax highlight
if exists source-highlight; then
    function lvc() { src-hilite-lesspipe.sh $1 | lv -c }
    alias lv=lvc
fi

# percolでヒストリ検索
if exists percol; then
    function percol_select_history() {
        local tac
        exists gtac && tac=gtac || tac=tac
        BUFFER=$(history | LC_ALL=C sed 's/^ *[0-9*]* *//' | $tac | percol --match-method regex --query "$LBUFFER")
        CURSOR=$#BUFFER         # move cursor
        zle -R -c               # refresh
    }
    zle -N percol_select_history
    bindkey '^R' percol_select_history

    function percol-git-recent-branches () {
        local selected_branch=$(git for-each-ref --format='%(refname)' --sort=-committerdate refs/heads | \
            perl -pne 's{^refs/heads/}{}' | \
            percol --query "$LBUFFER")
        if [ -n "$selected_branch" ]; then
            BUFFER="git checkout ${selected_branch}"
            zle accept-line
        fi
        zle clear-screen
    }
    zle -N percol-git-recent-branches

    function percol-git-recent-all-branches () {
        local selected_branch=$(git for-each-ref --format='%(refname)' --sort=-committerdate refs/heads refs/remotes | \
            perl -pne 's{^refs/(heads|remotes)/}{}' | \
            percol --query "$LBUFFER")
        if [ -n "$selected_branch" ]; then
            BUFFER="git checkout -t ${selected_branch}"
            zle accept-line
        fi
        zle clear-screen
    }
    zle -N percol-git-recent-all-branches
    bindkey '^x^b' percol-git-recent-branches
    bindkey '^xb' percol-git-recent-all-branches
fi

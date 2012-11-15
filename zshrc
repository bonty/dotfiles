# .zshrc

source ~/.zsh.d/zshrc

# antigen.zsh
source ~/.zsh.d/antigen.zsh

# packages
source ~/.zsh.d/package.zsh
# source ~/.zsh.d/config/auto-fu.zsh
source ~/.zsh.d/config/zsh-completions.zsh

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

# shellの$PATHをGUIのEmacsでも読めるように
# @http://d.hatena.ne.jp/syohex/20111117/1321503477
perl -wle 'do { print qq/(setenv "$_" "$ENV{$_}")/ if exists $ENV{$_} } for @ARGV' PATH > ~/.emacs.d/config/shellenv.el

# percolでヒストリ検索
functions exists() { which $1 &> /dev/null }

if exists percol; then
    function percol_select_history() {
        local tac
        exists gtac && tac=gtac || tac=tac
        BUFFER=$($tac $HISTFILE | sed 's/^: [0-9]*:[0-9]*;//' | percol --match-method regex --query "$LBUFFER")
        CURSOR=$#BUFFER         # move cursor
        zle -R -c               # refresh
    }
    zle -N percol_select_history
    bindkey '^R' percol_select_history
fi

# .zshrc

source ~/.zsh.d/zshrc

# packages
source ~/.zsh.d/package.zsh
source ~/.zsh.d/config/auto-fu.zsh
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


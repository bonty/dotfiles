# environment
export LANG="ja_JP.UTF-8"
export LC_CTYPE="ja_JP.UTF-8"

# export TMP="$HOME/tmp"
# export EDITOR="emacsclient"
# export GREP_OPTIONS="--color=auto"
export LS_COLORS=':no=00:fi=00:di=36:ln=35:pi=33:so=32:bd=34;46:cd=34;43:ex=31:'
export PERL5LIB=$HOME/usr/lib/perl:$PERL5LIB
PATH=$HOME/usr/bin:/usr/local/bin:/usr/X11R6/bin:/usr/X11/bin:/usr/bin:/usr/sbin:/share/usr/bin:/sbin:/bin:${PATH}
WORDCHARS='*?_-.[]~&;!#$%^(){}<>'

if [ -e `which lv` ]; then
    export PAGER=`which lv`
else
    export PAGER="/usr/bin/less"
fi

if [ -e "/usr/local/bin/zsh" ]; then
    export SHELL="/usr/local/bin/zsh"
else
    export SHELL="/bin/zsh"
fi

# history
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
function history-all { history -E 1 } # show all history

# auto completion
autoload -U compinit
compinit -u

# utf8 env
export LV='-Ou8'
export PERL_BADLANG=0

# exit if not prompt process
[ $#PROMPT -eq 0 -o $#TERM -eq 0 ] && return

# PROMPT, RPROMPT
autoload colors
colors

case ${UID} in
    0)
        PROMPT="[%{${fg[blue]}%}%n@%m%{${reset_color}%}] %{${fg[blue]}%}#%{${reset_color}%} "
        PROMPT2="%B%{${fg[blue]}%}%_#%{${reset_color}%}%b "
        SPROMPT="%B%{${fg[blue]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
        RPROMPT="%{${fg[blue]}%}[%/]%{${reset_color}%}"
        ;;
    *)
        PROMPT="[%n@%m] $ "
        PROMPT2="%B%_$%b "
        SPROMPT="%B%r is correct? [n,y,a,e]:%b "
        RPROMPT="[%/]"
        ;;
esac

# coloring completion
# eval `dircolors -b`
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# ignore capital letter
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# aliases
case "${OSTYPE}" in
    freebsd*|darwin*)
    alias ls='ls -G -w'
    ;;
    linux*)
    alias ls='ls -F --color=tty'
    ;;
esac
alias sl='ls'
alias l='ls'
alias la='ls -a'
alias ll='ls -l'
# alias lv='$PAGER'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias h='history 20'
alias emacs='TERM=xterm-256color emacs -nw'
alias e='emacs'
alias screen='screen -U'
alias s='screen'
alias x='exit'
alias q='exit'

alias -g L='| $PAGER'
alias -g G='| grep'
alias -g H='| head'
alias -g T='| tail'
alias -g W='| wc'

alias gomi='rm -f *~ \#*'
alias cpan='perl -MCPAN -e shell'

# options
setopt append_history
setopt auto_cd
setopt auto_list
setopt auto_param_keys
setopt auto_param_slash
setopt auto_pushd
setopt auto_remove_slash
setopt auto_resume
setopt complete_in_word
# setopt correct
setopt equals
setopt extended_glob
setopt extended_history
setopt function_argzero
setopt hist_reduce_blanks
setopt hist_ignore_dups
setopt hist_no_store
setopt ignore_eof
setopt list_types
setopt long_list_jobs
setopt magic_equal_subst
setopt mark_dirs
setopt numeric_glob_sort
setopt NO_beep
setopt no_nomatch
setopt nohup
setopt print_eight_bit
setopt prompt_subst
setopt pushd_ignore_dups
setopt pushd_silent
setopt pushd_to_home
setopt share_history
setopt short_loops
setopt sun_keyboard_hack

unsetopt promptcr

# bindkey
bindkey -e # emacs like
bindkey "^[f" emacs-forward-word
bindkey "^[b" emacs-backward-word
bindkey "^/" undo

# history setting
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[p" history-beginning-search-backward-end
bindkey "^[n" history-beginning-search-forward-end

# replace
autoload replace-string
zle -N replace-string
bindkey "^[%" replace-string

# emacs setting
if [ "$EMACS" = t ]; then
    unsetopt zle
    stty -echo
fi

# ssh
function ssh_screen(){
    eval server=?${$#}
        screen -t $server ssh "$@"
}
if [ ${TERM%%-*} = screen ]; then
    # alias ssh=ssh_screen
    
    local -a shorthost
    echo $TERMCAP | grep -q -i screen
    if [ $? -eq 0 ]; then
        shorthost=""
    else
        shorthost="${HOST%%.*}"
    fi

    # echo -ne "\ek$shorthost\e\\"

    preexec() {
        if [ "$shorthost" = "" ]; then
            echo -ne "\ek${1%% *}\e\\"
        else
            echo -ne "\ek${1%% *}@${shorthost}\e\\"
        fi
        # echo -ne "\e_`dirs`\e\\"
    }

    precmd() {
        if [ "$shorthost" = "" ]; then
            echo -ne "\ek$(basename $(print -P %~))\e\\"
        else
            echo -ne "\ek$(basename $(print -P %~))@${shorthost}\e\\"
        fi
    }
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

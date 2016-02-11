# alias

### grep -r def *.rb L -> grep -r def *.rb |& lv
alias -g L="|& $PAGER"
alias -g G='| grep'

alias -g H='| head'
alias -g T='| tail'
alias -g S='| sed'

alias -g W='| wc -l'
alias -g X='| xargs'
alias -g P='| peco'
alias -g F='| fzf'

alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

## lsとpsの設定
### ls: できるだけGNU lsを使う。
### ps: 自分関連のプロセスのみ表示。
case $(uname) in
    *BSD|Darwin)
	if [ -x "$(which gnuls)" ]; then
	    alias ls="gnuls"
	    alias la="ls -AF --color=auto"
	else
            alias ls="ls -FG"
	    alias la="ls -AFG"
	fi
	;;
    SunOS)
	if [ -x "`which gls`" ]; then
	    alias ls="gls"
	    alias la="ls -AF --color=auto"
	else
            alias ls="ls -F --color=auto"
	    alias la="ls -AF"
	fi
	;;
    *)
        alias ls="ls -F --color=auto"
	alias la="ls -AF --color=auto"
	;;
esac

alias sl='ls'
alias l='ls'
alias ll='ls -l'
alias lh='ls -lh'

alias r='rails'
alias be='bundle exec'

alias tmux='tmux -u'
alias ta='tmux attach'

# prevent brew doctor warning
# @see: http://qiita.com/takc923/items/45386905f70fde9af0e7
# alias brew="env PATH=${PATH/$HOME\/\.pyenv\/shims:?/} brew"

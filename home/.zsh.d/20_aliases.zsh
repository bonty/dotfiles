# ls
alias ls='ls -FG'
alias sl='ls'
alias l='ls'
alias ll='ls -l'
alias lla='ls -lA'
alias lh='ls -lh'
alias la='ls -A'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias lv="$PAGER"
if has source-highlight; then
    function lessc() { src-hilite-lesspipe.sh $1 | $PAGER }
    export PAGER=lessc
fi

alias zmv='noglob zmv -W'

alias r='rails'
alias be='bundle exec'

alias tmux='tmux -u'
alias ta='tmux attach'

# prevent brew doctor warning
# @see: http://qiita.com/takc923/items/45386905f70fde9af0e7
# alias brew="env PATH=${PATH/$HOME\/\.pyenv\/shims:?/} brew"

alias -g L="|& $PAGER"
alias -g G='| grep'

alias -g H='| head'
alias -g T='| tail'
alias -g S='| sort'
alias -g U='| uniq'

alias -g W='| wc -l'
alias -g X='| xargs'
alias -g F='| fzf'

pygmentize_alias() {
    if has "pygmentize"; then
        local get_styles styles style
        get_styles="from pygments.styles import get_all_styles
        styles = list(get_all_styles())
        print('\n'.join(styles))"
        styles=( $(sed -e 's/^  *//g' <<<"$get_styles" | python) )

        style=${${(M)styles:#solarized}:-default}
        cat_alias "$@" | pygmentize -O style="$style" -f console256 -g
    else
        cat -
    fi
}
alias -g P='| pygmentize_alias'

alias -g A='| awk'

alias -g B='`git branch | fzf --select-1 | sed -e "s/^\*[ ]*//g"`'

alias -s pl='perl'
alias -s rb='ruby'
alias -s py='python'
alias -s php='php -f'
alias -s {gif,jpg,jpeg,png,bmp}='display'
function extract() {
  case $1 in
    *.tar.gz|*.tgz) tar xzvf $1;;
    *.tar.xz) tar Jxvf $1;;
    *.zip) unzip $1;;
    *.lzh) lha e $1;;
    *.tar.bz2|*.tbz) tar xjvf $1;;
    *.tar.Z) tar zxvf $1;;
    *.gz) gzip -d $1;;
    *.bz2) bzip2 -dc $1;;
    *.Z) uncompress $1;;
    *.tar) tar xvf $1;;
    *.arj) unarj $1;;
  esac
}
alias -s {gz,tgz,zip,lzh,bz2,tbz,Z,tar,arj,xz}=extract

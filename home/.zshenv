# Lanugage settings
export LANGUAGE=en_US.UTF-8
export LANG=${LANGUAGE}
export LC_ALL=${LANGUAGE}
export LC_CTYPE=${LANGUAGE}

# Editor
export EDITOR=emacsclient
export GIT_EDITOR=${EDITOR}

# Pager
export PAGER=less
# Less status line
export LESS='-R -f -X -i -P ?f%f:(stdin). ?lb%lb?L/%L.. [?eEOF:?pb%pb\%..]'
export LESSCHARSET='utf-8'

# LESS man page colors (makes Man pages more readable).
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[00;44;37m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# ls command colors
export LSCOLORS=exfxcxdxbxegedabagacad

# grep
export GREP_OPTIONS="--binary-files=without-match --color=auto"

# Word splitter
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>/|'

# History file and its size
export HISTFILE=~/.zsh_history
export HISTSIZE=1000000
export SAVEHIST=1000000

# Automatically report running time
export REPORTTIME=3

# Ignore path dups
typeset -U path
path=($HOME/bin(N-/)
      $HOME/local/bin(N-/)
      # for gem install --user-install
      $HOME/.gem/ruby/*/bin(N-/)
      # for nodebrew
      $HOME/.nodebrew/current/bin(N-/)
      # for rails project
      ./bin
      # for android development
      /Applications/android-sdk/sdk/platform-tools(N-/)
      # for heroku
      /usr/local/heroku/bin(N-/)
      # for Debian GNU/Linux
      /var/lib/gems/*/bin(N-/)
      # for system
      /usr/local/bin(N-/)
      /usr/local/sbin(N-/)
      /usr/X11R6/bin(N-/)
      /usr/X11/bin(N-/)
      /usr/bin(N-/)
      /usr/sbin(N-/)
      /bin(N-/)
      /sbin(N-/))

# Export SUDO_PATH with sudo_path
typeset -xT SUDO_PATH sudo_path
typeset -U sudo_path
sudo_path=({,/usr/pkg,/usr/local,/usr}/sbin(N-/))

cdpath=(~)
chpwd_functions=($chpwd_functions dirs)

# manpath
typeset -U manpath
manpath=($HOME/local/share/man(N-/)
         # for system
         /usr/local/share/man(N-/)
         /usr/share/man(N-/))

# ruby
# Export RUBYLIB with ruby_path
typeset -xT RUBYLIB ruby_path
typeset -U ruby_path
ruby_path=(./lib)

# python
# Export PYTHONPATH with python_path
typeset -xT PYTHONPATH python_path
typeset -U python_path
python_path=(./lib)

# golang
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=${HOME}/.go
export GOBIN=${GOPATH}/bin
export PATH=${GOBIN}:/usr/local/opt/go/libexec/bin:${PATH}

# setting for rbenv
eval "$(rbenv init - --no-rehash)"

# setting for plenv
eval "$(plenv init - --no-rehash)"

# setting for pyenv
eval "$(pyenv init - --no-rehash)"

# Java
export JAVA_HOME="$(/usr/libexec/java_home)"

# for homebrew-cask
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Android
export ANDROID_HOME="/usr/local/opt/android-sdk"
export NDK_ROOT="/usr/local/opt/android-ndk"
export ANDROID_SDK_ROOT="/usr/local/opt/android-sdk"
export ANT_ROOT="/usr/local/bin"
if [ -e $HOME/.profile ]; then
    source $HOME/.profile
fi

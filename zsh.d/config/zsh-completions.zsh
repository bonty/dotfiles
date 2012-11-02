# zsh-completions config

package-install github zsh-users/zsh-completions

fpath=($(package-directory zsh-users/zsh-completions)/src $fpath)

compinit

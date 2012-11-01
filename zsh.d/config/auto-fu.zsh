# auto-fu config

package-install github hchbaw/auto-fu.zsh
source $(package-directory hchbaw/auto-fu.zsh)/auto-fu.zsh

zle-line-init() {
    auto-fu-init
}
zle -N zle-line-init
zle -N zle-keymap-select auto-fu-zle-keymap-select

afu+cancel-and-accept-line() {
    ((afu_in_p == 1)) && { afu_in_p=0; BUFFER="$buffer_cur" }
    zle afu+accept-line
}
zle -N afu+cancel-and-accept-line
bindkey -M afu "^M" afu+cancel-and-accept-line

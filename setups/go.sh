#!/bin/sh

export GOROOT=$(brew --prefix go)/libexec
export GOPATH=~/.go

go get github.com/motemen/ghq
go get github.com/typester/gh-open
go get github.com/b4b4r07/gch

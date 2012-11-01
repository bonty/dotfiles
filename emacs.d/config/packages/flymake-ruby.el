;; -*- mode: emacs-lisp ; coding: utf-8 -*-

(el-get 'sync '(flymake-ruby))

(add-hook 'ruby-mode-hook 'flymake-ruby-load)

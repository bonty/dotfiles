;; -*- mode: emacs-lisp ; coding: utf-8 -*-

(el-get 'sync '(markdown-mode))

(require 'markdown-mode)

(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))

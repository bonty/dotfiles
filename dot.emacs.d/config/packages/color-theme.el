;; -*- mode: emacs-lisp ; coding: utf-8 -*-

(setq color-theme-libraries (directory-files "~/.emacs.d/packages/color-theme/themes" t "^color-theme"))
(el-get 'sync '(color-theme-almost-monokai))

(color-theme-almost-monokai)

;; -*- mode: emacs-lisp ; coding: utf-8 -*-

(require 'linum)
(when (not window-system)
  (setq linum-format "%4d "))
(global-linum-mode t)

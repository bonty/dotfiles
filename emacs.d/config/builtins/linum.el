;; -*- mode: emacs-lisp ; coding: utf-8 -*-

(require 'linum)

(if (window-system)
    (setq linum-format "%3d")
  (setq linum-format "%4d "))
  
(global-linum-mode t)

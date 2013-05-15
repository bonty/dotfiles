;; -*- mode: emacs-lisp ; coding: utf-8 -*-

(require 'linum)

;; (if (window-system)
;;     (setq linum-format "%d")
;;   (setq linum-format "%d "))
(global-linum-mode t)
(setq linum-format "%d")

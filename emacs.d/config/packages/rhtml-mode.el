;; -*- mode: emacs-lisp ; coding: utf-8 -*-

(el-get 'sync '(rhtml-mode))

;; rhtml-mode
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook
          (lambda () (rinari-launch)))

(set-face-background 'erb-face "#000")

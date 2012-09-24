;; -*- mode: emacs-lisp ; coding: utf-8 -*-

(el-get 'sync '(key-chord))

(require 'key-chord)
(setq key-chord-two-keys-delay 0.04)
(key-chord-mode t)
(key-chord-define-global "jk" 'view-mode)
(key-chord-define-global "as" 'auto-save-buffers-toggle)

;; -*- mode: emacs-lisp ; coding: utf-8 -*-

(require 'whitespace)

;; automatically clean up bad whitespace
(setq whitespace-action '(auto-cleanup))
;; only show bad whitespace
(setq whitespace-style '(trailing space-before-tab indentation empty space-after-tab))

(global-whitespace-mode 1)

;; -*- mode: emacs-lisp ; coding: utf-8 -*-

(el-get 'sync '(revive))

(require 'revive)

(autoload-if-found 'save-current-configuration "revive" "Save status" t)
(autoload-if-found 'resume "revive" "Resume Emacs" t)
(autoload-if-found 'wipe "revive" "Wipe Emacs" t)

(define-key ctl-x-map "S" 'save-current-configuration)
(define-key ctl-x-map "F" 'resume)
(define-key ctl-x-map "K" 'wipe)

(add-hook 'kill-emacs-hook 'save-current-configuration) ; autosave when quit Emacs

;; -*- mode: emacs-lisp ; coding: utf-8 -*-

(el-get 'sync '(auto-save-buffers))

(require 'auto-save-buffers)
(run-with-idle-timer 10 t 'auto-save-buffers)

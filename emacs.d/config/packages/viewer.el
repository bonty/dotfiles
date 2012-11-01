;; -*- mode: emacs-lisp ; coding: utf-8 -*-

(el-get 'sync '(viewer))

(require 'viewer nil t)
(viewer-stay-in-setup)
(setq viewer-modeline-color-unwritable "tomato")
(setq viewer-modeline-color-view "orange")
(viewer-change-modeline-color-setup)

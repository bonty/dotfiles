;; -*- mode: emacs-lisp ; coding: utf-8 -*-

;; el-get
(add-to-list 'load-path "~/.emacs.d/packages/el-get")
(unless (require 'el-get nil t)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (end-of-buffer)
    (eval-print-last-sexp)))

;; recipe directory
(add-to-list 'el-get-recipe-path
             (concat (file-name-directory load-file-name) "/el-get/recipes"))

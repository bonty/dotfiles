;; -*- mode: emacs-lisp ; coding: utf-8 -*-

;; el-get
(setq el-get-dir "~/.emacs.d/packages/")

(unless (require 'el-get nil t)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (end-of-buffer)
    (eval-print-last-sexp)))

;; recipe directory
(add-to-list 'el-get-recipe-path
             (concat (file-name-directory load-file-name) "/el-get/recipes/"))

;; load packages config
(load-directory-files "~/.emacs.d/config/packages/" "^.+el$")

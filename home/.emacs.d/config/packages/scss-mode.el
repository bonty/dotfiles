;; -*- mode: emacs-lisp ; coding: utf-8 -*-

(el-get 'sync '(scss-mode))

(autoload 'scss-mode "scss-mode")
(setq scss-compile-at-save nil)
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

(add-hook 'scss-mode-hook
          (lambda ()
            (setq css-indent-offset 2)
            (setq scss-compile-at-save nil)
            (flymake-mode t)
            ))

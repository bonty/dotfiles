(unless load-file-name
  (cd (getenv "HOME")))

(require 'cl-lib)

;; enable to test temporary .emacs
;; usage: emacs -q -l ~/path/to/init.el
(when load-file-name
  (setq-default user-emacs-directory (file-name-directory load-file-name)))

;; el-get bundle
(load (concat user-emacs-directory "el-get-bundle.el"))

;; loading theme
(load-theme 'reverse t t)
(enable-theme 'reverse)

;; init-loader
(custom-set-variables
 '(init-loader-show-log-after-init 'error-only))
(init-loader-load (locate-user-emacs-file "init-loader"))

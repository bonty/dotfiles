;; enable to test temporary .emacs
;; usage: emacs -q -l ~/path/to/init.el
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

;; el-get bundle
(load (concat user-emacs-directory "el-get-bundle.el"))

;; load environment variables
(exec-path-from-shell-initialize)

;; loading theme
(load-theme 'reverse t t)
(enable-theme 'reverse)

;; init-loader
(custom-set-variables
 '(init-loader-show-log-after-init 'error-only))
;; '(init-loader-byte-compile t))

(init-loader-load (locate-user-emacs-file "init-loader"))

;; hide compilation results
;; (let ((win (get-buffer-window "*Compile-Log*")))
;;   (when win (delete-window win)))

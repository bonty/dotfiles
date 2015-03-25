;; enable to test temporary .emacs
;; usage: emacs -q -l ~/path/to/init.el
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

;; separate installed directory by emacs-version
(let ((versioned-dir (locate-user-emacs-file (concat "el-get/" emacs-version))))
  (setq-default el-get-dir (expand-file-name versioned-dir "el-get")
		package-user-dir (expand-file-name versioned-dir "elpa")))

;; el-get install
(setq-default el-get-emacswiki-base-url
              "http://raw.github.com/emacsmirror/emacswiki.org/master/")
(add-to-list 'load-path (expand-file-name "bundle" el-get-dir))
(unless (require 'bundle nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "http://raw.github.com/tarao/bundle-el/master/bundle-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;; add self-recipe path
(add-to-list 'el-get-recipe-path (locate-user-emacs-file "recipes"))

;; lock package versions
(bundle tarao/el-get-lock
  (el-get-lock))

;; byte compile bundle config
(bundle with-eval-after-load-feature)

;; install init-loader
(bundle! emacs-jp/init-loader
  (setq-default init-loader-show-log-after-init t
                init-loader-byte-compile t)

  (init-loader-load (locate-user-emacs-file "init-loader"))

  ;; hide compilation results
  (let ((win (get-buffer-window "*Compile-Log*")))
    (when win (delete-window win))))

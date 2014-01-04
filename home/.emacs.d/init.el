;; load path
(setq load-path
      (append
       (list
        (expand-file-name "~/.emacs.d/")
        (expand-file-name "~/.emacs.d/elisp/")
        (expand-file-name "~/.emacs.d/elisp/el-get/el-get/"))
       load-path))

;; ELPA preferences
(require 'package)
(setq package-user-dir "~/.emacs.d/elisp/elpa/")
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; init-loader
;; First time Emacs launch, this statment will raise error.
;; You should exec this command "M-x package-install init-loader".
(require 'init-loader)
(init-loader-load "~/.emacs.d/inits")

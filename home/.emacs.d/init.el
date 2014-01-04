;; ELPA preferences
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; init-loader
;; install init-loader if not installed
(when (or (not (package-installed-p 'init-loader)))
  (package-install 'init-loader))
(require 'init-loader)
(init-loader-load (concat user-emacs-directory "inits"))

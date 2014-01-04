;; ELPA preferences
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; init-loader
;; First time Emacs launch, this statment will raise error.
;; You should exec this command "M-x package-install init-loader".
(require 'init-loader)
(init-loader-load "~/.emacs.d/inits")

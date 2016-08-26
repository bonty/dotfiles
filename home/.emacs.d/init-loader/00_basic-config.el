;; fontlock general filetype
(require 'generic-x)

;; encoding
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8-unix)

;; Basic coloring
(global-font-lock-mode t)

;; customize variables
(custom-set-variables
 '(package-enable-at-startup nil)
 '(large-file-warning-threshold (* 25 1024 1024))

 ;; don't show startup screen
 '(inhibit-startup-screen t)

 ;; ignore case at dabbrev
 '(dabbrev-case-fold-search t)
 '(dabbrev-case-replace nil)

 ;; ignore case at read file/buffer
 '(read-file-name-completion-ignore-case t)
 '(read-buffer-completion-ignore-case t)

 ;; do not create backup files
 '(make-backup-files nil)
 '(delete-auto-save-files t)
 '(create-lockfiles nil)

 ;; comment style
 '(comment-style 'multi-line)
 )

;; disable horizontal scroll bar
(setq-default horizontal-scroll-bar nil)

;; increase GC threshold
(setq-default gc-cons-threshold (* gc-cons-threshold 10))

;; faster echo stroke
(setq-default echo-keystrokes 0.1)

;; remove menu bar
(menu-bar-mode -1)

;; show line/column number
(line-number-mode t)
(column-number-mode t)

;; delete
(delete-selection-mode t)

;; which func
(which-function-mode t)
(setq-default which-func-unknown "")

;; visit symbolic link
(setq-default find-file-visit-truename t)

;; invisible mouse cursor when editing text
(setq-default make-pointer-invisible t)

;; fill column limit 80
(setq-default fill-column 80)

;; highlight
(show-paren-mode t)
(custom-set-variables
 '(show-paren-ring-bell-on-mismatch t))
(setq transient-mark-mode t)
(setq search-highlight t)
(setq lazy-highlight-initial-delay 0)
(setq query-replace-highlight t)
;; (global-hl-line-mode 1)

;; yes/no -> y/n
(defalias 'yes-or-no-p 'y-or-n-p)
(setq-default use-dialog-box nil)

;; run server
(require 'server)
(unless (server-running-p)
  (server-start))

;; smartrep
(require 'smartrep)
(custom-set-variables
 '(smartrep-mode-line-active-bg nil)
 '(smartrep-mode-line-string-activated "<<< SmartRep >>>"))

;; ispell config
(setq ispell-program-name "/usr/local/bin/aspell")

;; editorconfig
(require 'editorconfig)
(editorconfig-mode 1)

(require 'cl-lib)
(require 'generic-x)

;; encoding
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8-unix)

;; basic coloring
(global-font-lock-mode t)

;; do not show startup screen
(setq inhibit-startup-screen t)

;; ignore case at dabbrev
(custom-set-variables
 '(dabbrev-case-fold-search t)
 '(dabbrev-case-replace nil))

;; ignore case at read file/buffer
(setq read-file-name-completion-ignore-case t)
(setq read-buffer-completion-ignore-case t)

;; remove menu bar
(menu-bar-mode -1)

;; show line/column number
(line-number-mode t)
(column-number-mode t)

;; do not create backup files
(setq make-backup-files nil)
(setq delete-auto-save-files t)
(setq create-lockfiles nil)

;; delete
(delete-selection-mode t)

;; which func
(which-function-mode t)

;; visit symbolic link
(setq find-file-visit-truename t)

;; comment style
(setq comment-style 'multi-line)

;; highlight
(show-paren-mode t)
(custom-set-variables
 '(show-paren-ring-bell-on-mismatch t))
(setq transient-mark-mode t)
(setq search-highlight t)
(setq lazy-highlight-initial-delay 0)
(setq query-replace-highlight t)

;; increase GC threshold
(setq gc-cons-threshold (* 128 1024 1024))

;; yes/no -> y/n
(defalias 'yes-or-no-p 'y-or-n-p)

;; run server
(require 'server)
(unless (server-running-p)
  (server-start))

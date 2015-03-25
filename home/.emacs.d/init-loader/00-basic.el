(require 'cl-lib)

;; encoding
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8-unix)

;; customize variables
(custom-set-variables

 ;; do not show startup screen
 '(inhibit-startup-screen t)

 ;; remove scratch header message
 '(initial-scratch-message nil)

 ;; ignore case at dabbrev
 '(dabbrev-case-fold-search t)
 '(dabbrev-case-replace nil)

 ;; ignore case at read file/buffer
 '(read-file-name-completion-ignore-case t)
 '(read-buffer-completion-ignore-case t)

 ;; remove menu bar and tool bar
 '(menu-bar-mode nil)
 '(tool-bar-mode nil)

 ;; do not create backup files
 '(make-backup-files nil)
 '(delete-auto-save-files t)
 '(create-lockfiles nil)

 ;; show line/column number
 '(line-number-mode t)
 '(column-number-mode t)

 ;; delete
 '(delete-selection-mode t)

 ;; indent
 '(indent-tabs-mode nil)
 '(indent-line-function 'indent-relative-maybe)

 ;; visit symbolic link
 '(find-file-visit-truename t)

 ;; comment style
 '(comment-style 'multi-line)

 ;; highlight
 '(show-paren-mode t)
 '(show-paren-ring-bell-on-mismatch t)
 '(transient-mark-mode t)
 '(search-highlight t)
 '(isearch-lazy-highlight-initial-delay 0)
 '(query-replace-highlight t)

 ;; increase GC threshold
 '(gc-cons-threshold (* gc-cons-threshold 10))
 )

;; yes/no -> y/n
(defalias 'yes-or-no-p 'y-or-n-p)

;; run server
(require 'server)
(unless (server-running-p)
  (server-start))

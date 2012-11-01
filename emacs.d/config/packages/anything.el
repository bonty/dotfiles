;; -*- mode: emacs-lisp ; coding: utf-8 -*-

(el-get 'sync '(anything))

;; copy of anything-startup.el
(require 'anything-config)

;;; anything-match-plugin.el extends pattern matching. Some Anything
;;; Applications requires it. It is a must-have plugin now.
;;; 
(require 'anything-match-plugin)

;;; If you use Japanese, you should install Migemo and anything-migemo.el.
;;;
;;; Migemo  http://0xcc.net/migemo/
(and (equal current-language-environment "Japanese")
     (require 'anything-migemo nil t))

;;; anything-complete.el replaces various completion with anything
;;; (like Icicles). Use Anything power for normal completion.
(when (require 'anything-complete nil t)
  ;; Automatically collect symbols by 150 secs
  (anything-lisp-complete-symbol-set-timer 150)
  (define-key emacs-lisp-mode-map "\C-\M-i" 'anything-lisp-complete-symbol-partial-match)
  (define-key lisp-interaction-mode-map "\C-\M-i" 'anything-lisp-complete-symbol-partial-match)
  ;; Comment if you do not want to replace completion commands with `anything'.
  (anything-read-string-mode 1)
  )

;;; anything-show-completion.el shows current selection prettily.
(require 'anything-show-completion)

;;; anything-auto-install.el integrates auto-install.el with anything.
(require 'anything-auto-install nil t)

;;; descbinds-anything.el replaces describe-bindings with anything interface.
(when (require 'descbinds-anything nil t)
  ;; Comment if you do not want to replace `describe-bindings' with `anything'.
  (descbinds-anything-install)
  )

;;; `anything-grep' replaces standard `grep' command.
(require 'anything-grep nil t)

;; my settings
;; (setq anything-enable-shortcuts 'alphabet
;;       anything-sources
;;       (list anything-c-source-buffers
;;             anything-c-source-file-name-history
;;             anything-c-source-info-pages
;;             anything-c-source-man-pages
;;             anything-c-source-locate
;;             anything-c-source-emacs-commands
;;             anything-c-source-complete-shell-history
;;             ))

(global-set-key (kbd "M-y") 'anything-show-kill-ring)

(mapc '(lambda (key)
         (global-set-key key 'anything))
      (list
       [(control ?:)]
       [(control \;)]
       [(control x)(b)]
       [(control x)(control :)]
       [(control x)(control \;)]))

;; anything-dabbrev-expand
(when (require 'anything-dabbrev-expand nil t)
  (global-set-key (kbd "C-o") 'anything-dabbrev-expand)
  (define-key anything-dabbrev-map (kbd "C-o") 'anything-dabbrev-find-all-buffers))

;; anything-c-moccur
(when (require 'anything-c-moccur nil t)
  (setq moccur-split-word t)
  (global-set-key (kbd "M-s") 'anything-c-moccur-occur-by-moccur)
  (define-key isearch-mode-map (kbd "C-o") 'anything-c-moccur-from-isearch)
  (define-key isearch-mode-map (kbd "C-M-o") 'isearch-occur)
  )

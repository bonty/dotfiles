;; -*- mode: emacs-lisp ; coding: utf-8 -*-

;; Common Lisp exstensions for Emacs
(require 'cl nil t)

;; load-path
(add-to-list 'load-path user-emacs-directory)
;; (let ((default-directory "~/.emacs.d/packages"))
;;   (setq load-path (cons default-directory load-path))
;;   (normal-top-level-add-subdirs-to-load-path))

;; load shell $PATH
;; @see http://d.hatena.ne.jp/syohex/20111117/1321503477
;; (load-file (expand-file-name "~/.emacs.d/config/shellenv.el"))
;; (dolist (path (reverse (split-string (getenv "PATH") ":")))
;;   (add-to-list 'exec-path path))

;; load function/macro

;; (load "functions/functions")
;; (load "functions/macros")
(defun x->bool (elt) (not (not elt)))

(defmacro eval-safe (&rest body)
  `(condition-case err
       (progn ,@body)
     (error (message "[eval-safe] %s" err))))

;; system-type predicates
;; @see http://github.com/elim/dotemacs/blob/master/init.el
(setq darwin-p  (eq system-type 'darwin)
      ns-p      (featurep 'ns)
      carbon-p  (eq window-system 'mac)
      linux-p   (eq system-type 'gnu/linux)
      colinux-p (when linux-p
                  (let ((file "/proc/modules"))
                    (and
                     (file-readable-p file)
                     (x->bool
                      (with-temp-buffer
                        (insert-file-contents file)
                        (goto-char (point-min))
                        (re-search-forward "^cofuse\.+" nil t))))))
      cygwin-p  (eq system-type 'cygwin)
      nt-p      (eq system-type 'windows-nt)
      meadow-p  (featurep 'meadow)
      windows-p (or cygwin-p nt-p meadow-p))

;; locale setting
(set-language-environment "Japanese")
(set-language-environment-coding-systems "Japanese")
(prefer-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8-unix)
(setq default-buffer-file-coding-system 'utf-8)
(setq local-coding-system 'utf-8)
(setq file-name-coding-system 'utf-8)
(setq default-file-name-coding-system 'utf-8)

;; hide startup message
(setq inhibit-startup-message t)

;; hide menubar and toolbar
(when (not window-system)
  (eval-safe (menu-bar-mode -1))
  (eval-safe (tool-bar-mode -1)))

;; hide scrollbar
(when window-system
  (eval-safe (scroll-bar-mode -1))
  (eval-safe (tool-bar-mode -1)))

;; disable backup and auto-save-default
(setq make-backup-files nil)
(setq delete-auto-save-files t)

;; show line num and column num
(line-number-mode t)
(column-number-mode t)

;; show file directory in mode line
(add-to-list 'global-mode-string '("" default-directory ""))

;; yes/no -> y/n
(fset 'yes-or-no-p 'y-or-n-p)

;; delete region when input something
(delete-selection-mode t)

;; set space indent (not tab)
(setq-default indent-tabs-mode nil)

;; auto relative indent
(setq indent-line-function 'indent-relative-maybe)

;; hide password
(add-hook 'comint-output-filter-functions
          'comint-watch-for-password-prompt)

;; enable iswitchb mode
(iswitchb-mode t)

;; completion ignore case
(setq completion-ignore-case t)

;; auto revert buffer
(global-auto-revert-mode t)

;; show newline code
(setq eol-mnemonic-dos "(CRLF)")
(setq eol-mnemonic-mac "(CR)")
(setq eol-mnemonic-unix "(LF)")

;; highlight
(show-paren-mode t)
(setq show-paren-ring-bell-on-mismatch t)
(setq transient-mark-mode t)
(setq search-highlight t)
(setq isearch-lazy-highlight-initial-delay 0)
(setq query-replace-highlight t)
(global-font-lock-mode t)

;; font
;; @see http//d.hatena.ne.jp/antipop/20100126/1264493522
(when window-system
  (when (>= emacs-major-version 23)
    (set-face-attribute 'default nil
                        :family "Ricty"
                        :height 130)
    (set-fontset-font
     (frame-parameter nil 'font)
     'japanese-jisx0208
     '("Ricty" . "iso10646-1"))
    (set-fontset-font
     (frame-parameter nil 'font)
     'japanese-jisx0212
     '("Ricty" . "iso10646-1"))
    (set-fontset-font
     (frame-parameter nil 'font)
     'mule-unicode-0100-24ff
     '("Ricty" . "iso10646-1"))
    ;; for hankaku kana
    (set-fontset-font
     (frame-parameter nil 'font)
     'katakana-jisx0201
     '("Ricty" . "iso10646-1"))
    ))

;; window opacity
(when window-system
  (progn
    (set-frame-parameter nil 'alpha 75)))

;; Command-Key and Option-Key (for Mac)
(when darwin-p
  (when ns-p
    (setq ns-command-modifier 'meta)
    (setq ns-alternate-modifier 'super)
    (setq ns-right-command-modifier 'hyper)))

(when darwin-p
  (require 'ls-lisp)
  (setq ls-lisp-use-insert-directory-program nil))

;; save buffer with deleting trailing whitespace
(defun save-buffer-with-delete-trailing-whitespace ()
  "save buffer with deleting trailing whitespace"
  (interactive)
  (delete-trailing-whitespace)
  (save-buffer))

;; move beginning of indented line
;; @see http://d.hatena.ne.jp/gifnksm/20100131/1264956220
(defun beginning-of-indented-line (current-point)
  "move beginning of indented line"
  (interactive "d")
  (let ((vhead-pos (save-excursion (progn (beginning-of-visual-line) (point))))
        (head-pos (save-excursion (progn (beginning-of-line) (point)))))
    (cond
     ;; when current pos is first visual line
     ((eq vhead-pos head-pos)
      (if (string-match
           "^[ \t]+$"
           (buffer-substring-no-properties vhead-pos current-point))
          (beginning-of-visual-line)
        (back-to-indentation)))
     ;; when current pos is head of second visual line
     ((eq vhead-pos current-point)
      (backward-char)
      (beginning-of-visual-indented-line (point)))
     ;; when current pos is second visual line
     (t (beginning-of-visual-line)))))

(defface hlline-face
  '((((class color)
      (background dark))
     (:background "dark slate gray"))
    (((class color)
      (background light))
     (:background "#98FB98"))
    (t
     ()))
  "*Face used in hl-line")
(setq hl-line-face 'hlline-face)
(global-hl-line-mode)

;; load builtins config
(load "config/builtins")
;; load packages config
;; (load "config/packages")

;; launch server when not launched
(require 'server)
(unless (server-running-p)
  (server-start))

;; Eof

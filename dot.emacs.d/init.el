;; -*- mode: emacs-lisp ; coding: utf-8 -*-

;; Common Lisp exstensions for Emacs
(require 'cl nil t)

;; load-path
(add-to-list 'load-path "~/.emacs.d")
(let ((default-directory "~/.emacs.d/packages"))
  (setq load-path (cons default-directory load-path))
  (normal-top-level-add-subdirs-to-load-path))

;; load function/macro
(load "functions/functions")
(load "functions/macros")

;; locale setting
(set-locale-environment nil)

;; hide startup message
(setq inhibit-startup-message t)

;; hide menubar and toolbar
(when (not window-system)
  (menu-bar-mode -1))
(tool-bar-mode -1)

;; disable backup and auto-save-default
(setq make-backup-files -1)
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
                        :height 140)))

;; window opacity
(when window-system
  (progn
    (set-frame-parameter nil 'alpha 85)))

;; keybind
(define-key isearch-mode-map (kbd "C-k") 'isearch-edit-string)
(define-key global-map (kbd "C-c c") 'comment-region)
(define-key global-map (kbd "C-c u") 'uncomment-region)
(define-key global-map (kbd "C-c r") 'replace-string)
(define-key global-map (kbd "C-c i") 'indent-region)
(define-key global-map (kbd "C-\\") 'undo)
(define-key global-map (kbd "M-/") 'undo-tree-redo)
(define-key global-map (kbd "C-h") 'delete-backward-char)
(define-key global-map (kbd "C-c g") 'goto-line)
(define-key function-key-map [delete] (kbd "C-d"))
(define-key global-map (kbd "C-m") 'newline-and-indent)
(define-key global-map (kbd "C-a") 'beginning-of-indented-line)

(when (eq window-system 'ns)
  ;; toggle fullscreen mode
  (define-key global-map (kbd "M-<RET>") 'ns-toggle-fullscreen))

;; move beginning of indented line
;; @see http://d.hatena.ne.jp/gifnksm/20100131/1264956220
(defun beginning-of-indented-line (current-point)
  "move beginning of indented line"
  (interactive "d")
  (when (>= emacs-major-version 23)
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

  (when (< emacs-major-version 23)
    (if (string-match
         "^[ \t]+$"
         (save-excursion
           (buffer-substring-no-properties
            (progn (beginning-of-line) (point))
            current-point)))
        (beginning-of-line)
      (back-to-indentation))))

;; load builtins config
(load "config/builtins")

;; load packages config
(load "config/packages")

;; EOF

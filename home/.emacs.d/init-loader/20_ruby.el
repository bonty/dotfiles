(add-to-list 'auto-mode-alist '("\\.\\(rb\\|rake\\|rabl\\|gemspec\\|ru\\)$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\(Rake\\|Gem\\|Guard\\|Cap\\|Vagrant\\)file$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))

(custom-set-variables
 '(ruby-deep-indent-paren nil)
 '(ruby-insert-encoding-magic-comment nil))

(with-eval-after-load 'ruby-mode
  (add-hook 'ruby-mode-hook 'my/ruby-mode-hook)

  (define-key ruby-mode-map (kbd "|") 'my/ruby-insert-bar))

(defun my/ruby-mode-hook ()
  (setq flycheck-checker 'ruby-rubocop)

  (ruby-end-mode +1)
  (abbrev-mode 1)
  (electric-pair-mode t)
  (electric-layout-mode t)
  (electric-indent-mode t)

  (robe-mode +1)
  (add-to-list 'ac-sources 'ac-source-robe)

  (ruby-block-mode t)
  (setq ruby-block-highlight-toggle t))

;; indent setting
(defadvice ruby-indent-line (after unindent-closing-paren activate)
  (let ((column (current-column))
        indent offset)
    (save-excursion
      (back-to-indentation)
      (let ((state (syntax-ppss)))
        (setq offset (- column (current-column)))
        (when (and (eq (char-after) ?\))
                   (not (zerop (car state))))
          (goto-char (cadr state))
          (setq indent (current-indentation)))))
    (when indent
      (indent-line-to indent)
      (when (> offset 0) (forward-char offset)))))

;; insert "|"
(defun my/ruby-insert-bar ()
  (interactive)
  (if (looking-back "\\(?:do\\s-+\\|{\\)")
      (progn
        (insert "||")
        (backward-char 1))
    (insert "|")))

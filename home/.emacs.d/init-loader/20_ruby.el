(setq auto-mode-alist
      (append '(("\\.\\(rb\\|rake\\|rabl\\|gemspec\\|ru\\)$" . ruby-mode)) auto-mode-alist))
(setq auto-mode-alist
      (append '(("\\(Rake\\|Gem\\|Guard\\|Cap\\|Vagrant\\)file$" . ruby-mode)) auto-mode-alist))
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode)) interpreter-mode-alist))

(with-eval-after-load 'ruby-mode
  (add-hook 'ruby-mode-hook 'my/ruby-mode-hook)

  (require 'ruby-end)
  (add-hook 'ruby-mode-hook
            '(lambda ()
               (abbrev-mode 1)
               (electric-pair-mode t)
               (electric-layout-mode t)
               (electric-indent-mode t)))

  (require 'ruby-block)
  (ruby-block-mode t)
  (setq ruby-block-highlight-toggle t)

  ;; indent setting
  (setq ruby-deep-indent-paren-style nil)
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
        (when (> offset 0) (forward-char offset))))))

(defun my/ruby-mode-hook ()
  (setq flycheck-checker 'ruby-rubocop)

  (robe-mode +1)
  (add-to-list 'ac-source-robe 'ac-source-robe)

  (ruby-end-mode +1))

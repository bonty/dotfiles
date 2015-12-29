(with-eval-after-load 'dired
  (put 'dired-find-alternate-file 'disabled nil)

  (when (executable-find "gls")
    (setq insert-directory-program "gls"))

  (load-library "ls-lisp")

  (add-hook 'dired-initial-position-hook 'dired-k)

  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
  (define-key dired-mode-map (kbd "r") 'wdired-change-to-wdired-mode)
  (define-key dired-mode-map (kbd "g") 'dired-k))

(custom-set-variables
 '(ls-lisp-dirs-first t)
 '(dired-dwim-target t)
 '(dired-auto-revert-buffer t))

(global-set-key (kbd "C-x C-j") 'dired-jump)

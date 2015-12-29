;; yasnippet
(dolist (hook '(c-mode-hook
		c++-mode-hook
		java-mode-hook
		cperl-mode-hook
		emacs-lisp-mode-hook
		html-mode-hook
		js2-mode-hook
		python-mode-hook
		ruby-mode-hook
		sh-mode-hook
		markdown-mode-hook
		makefile-mode-hook))
  (add-hook hook 'yas-minor-mode))

(with-eval-after-load 'yasnippet
  (setq-default yas-snippet-dirs (concat user-emacs-directory "snippets"))
  (yas-reload-all))

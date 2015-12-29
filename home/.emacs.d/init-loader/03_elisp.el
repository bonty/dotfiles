;; emacs-lisp
(dolist (hook '(emacs-lisp-mode-hook
                ielm-mode-hook))
  (add-hook hook 'eldoc-mode)
  (add-hook hook 'elisp-slime-nav-mode))

(custom-set-variables
 '(eldoc-idle-delay 0.2))

(defun my/elisp-mode-hook ()
  (setq ac-sources '(ac-source-features ac-source-functions ac-source-variables ac-source-symbols)))
(add-hook 'emacs-lisp-mode-hook 'my/elisp-mode-hook)

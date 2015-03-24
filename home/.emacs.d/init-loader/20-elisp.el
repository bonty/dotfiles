;; jump to definition
(find-function-setup-keys)

;; eldoc
(dolist (hook '(emacs-lisp-mode-hook
                lisp-interaction-mode-hook
                eval-expression-minibuffer-setup-hook))
  (add-hook hook 'eldoc-mode))

(with-eval-after-load 'eldoc
  (set-face-attribute 'eldoc-highlight-function-argument nil
                      :underline t :foreground "green"
                      :weight 'bold))

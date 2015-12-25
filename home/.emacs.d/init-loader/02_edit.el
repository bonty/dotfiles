;; use regexp search as default
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "M-%") 'anzu-query-replace-regexp)
(global-set-key (kbd "ESC M-%") 'anzu-query-replace-at-cursor)
(global-set-key (kbd "C-x %") 'anzu-replace-at-cursor-thing)

;; indent
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq indent-line-function 'indent-relative-maybe)

;; electric-mode
(custom-set-variables
 '(electric-indent-mode nil))

(defvar my/electric-pair-enable-modes
  '(c-mode
    c++-mode
    csharp-mode
    java-mode
    python-mode
    ruby-mode
    sh-mode
    js-mode
    js2-mode
    css-mode
    cmake-mode
    coffee-mode
    cperl-mode
    markdown-mode))

(dolist (mode my/electric-pair-enable-modes)
  (add-hook (intern (format "%s-hook" mode)) 'electric-pair-local-mode))

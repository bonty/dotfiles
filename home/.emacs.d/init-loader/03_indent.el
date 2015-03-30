(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq indent-line-function 'indent-relative-maybe)

;; disable electric-indent-mode
(defvar my/disable-electric-indent-modes
  '(markdown-mode
    yaml-mode))

(dolist (mode my/disable-electric-indent-modes)
  (add-hook (intern (format "%s-hook" mode)) (lambda () (electric-indent-local-mode -1))))

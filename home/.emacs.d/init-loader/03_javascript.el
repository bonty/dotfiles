;; js2-mode
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))

(custom-set-variables
 '(js2-basic-offset 2))

(defun my/js2-mode-hook ()
  (setq flycheck-checker 'javascript-jshint))

(add-hook 'js2-mode-hook 'my/js2-mode-hook)

;; coffee script
(custom-set-variables
 '(coffee-tab-width 2))

(defun my/coffee-mode-hook ()
  (setq flycheck-checker 'coffee))

(with-eval-after-load 'coffee-mode
  (add-hook 'coffee-mode-hook 'my/coffee-mode-hook))

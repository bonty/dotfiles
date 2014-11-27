(defun my-c++-mode-hook ()
  (c-set-style "linux")
  (setq tab-width 4)
  (setq c-basic-offset tab-width))

(add-hook 'c++-mode-hook, 'my-c++-mode-hook)

;; use space instead of tab
(setq-default indent-tabs-mode nil)
(setq indent-line-function 'indent-relative-maybe)

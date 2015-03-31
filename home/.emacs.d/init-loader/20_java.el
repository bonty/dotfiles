(defun my/java-mode-hook ()
  (setq tab-width 4)
  (setq c-basic-offset tab-width))

(add-hook 'java-mode-hook 'my/java-mode-hook)

(with-eval-after-load 'cc-mode
  (define-key c-mode-map (kbd "C-c t") 'ff-find-other-file)
  (define-key c++-mode-map (kbd "C-c t") 'ff-find-other-file)

  (require 'ac-c-headers))

(defun my/c-mode-hook ()
  (c-set-style "linux")
  (setq tab-width 4)
  (setq c-basic-offset tab-width)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-header-symbols t))

(add-hook 'c-mode-hook 'my/c-mode-hook)
(add-hook 'c++-mode-hook 'my/c-mode-hook)

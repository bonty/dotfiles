;; make different same name file
(require 'uniquify)
(custom-set-variables
 '(uniquify-buffer-name-style 'post-forward-angle-blackets))

;; automatically revert buffer
(global-auto-revert-mode t)

;; save buffer with deleting trailing whitespace
(defun save-buffer-with-delete-trailing-whitespace ()
  "save buffer with deleting trailing whitespace"
  (interactive)
  (delete-trailing-whitespace)
  (save-buffer))

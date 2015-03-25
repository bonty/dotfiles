;; deletion
(global-set-key (kbd "C-h") 'delete-backward-char)

;; buffer
(global-set-key (kbd "C-x C-s") 'save-buffer-with-delete-trailing-whitespace)

;; region
(global-set-key (kbd "C-c c") 'comment-region)
(global-set-key (kbd "C-c u") 'uncomment-region)
(global-set-key (kbd "C-c i") 'indent-region)

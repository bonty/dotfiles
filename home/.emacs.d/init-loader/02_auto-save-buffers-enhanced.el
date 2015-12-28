;; auto-save-buffers-enhanced
(setq auto-save-buffers-enhanced-exclude-regexps '("COMMIT_EDITMSG" "MERGE_MSG" "PULLREQ_EDITMSG"))
(setq auto-save-buffers-enhanced-quiet-save-p t)
(auto-save-buffers-enhanced t)

;; save buffer with deleting trailing whitespace
(defun my/save-buffer-with-delete-trailing-whitespace ()
  "save buffer with deleting trailing whitespace"
  (interactive)
  (delete-trailing-whitespace)
  (save-buffer))

(global-set-key (kbd "C-x C-s") 'my/save-buffer-with-delete-trailing-whitespace)

;; deactivate auto-save-buffers-enhanced when auto-complete popup is open
(defadvice ac-start (before deactivate-auto-save-buffers activate)
  (setq auto-save-buffers-enhanced-activity-flag nil))

(defadvice ac-cleanup (after activate-auto-save-buffers activate)
  (setq auto-save-buffers-enhanced-activity-flag t))

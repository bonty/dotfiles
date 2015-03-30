;; make different same name file
(require 'uniquify)
(custom-set-variables
 '(uniquify-buffer-name-style 'post-forward-angle-brackets))

;; automatically revert buffer
(global-auto-revert-mode t)

;; auto-save-buffers-enhanced
(setq auto-save-buffers-enhanced-exclude-regexps '("^COMMIT_EDITMSG"))
(setq auto-save-buffers-enhanced-quiet-save-p t)
(auto-save-buffers-enhanced t)

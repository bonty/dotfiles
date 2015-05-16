;; helm
(custom-set-variables
 '(helm-input-idle-delay 0)
 '(helm-exit-idle-delay 0)
 '(helm-candidate-number-limit 500)
 '(helm-boring-file-regexp-list '("~$"))
 '(helm-mini-default-sources '(helm-source-buffers-list
                               helm-source-recentf
                               helm-source-files-in-current-dir
                               helm-source-mac-spotlight
                               helm-source-buffer-not-found)))

(helm-mode t)

(with-eval-after-load 'helm
  (helm-descbinds-mode)

  (global-set-key (kbd "C-x b") 'helm-mini)
  (global-set-key (kbd "C-x C-b") 'helm-mini)
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "M-p") 'helm-show-kill-ring)
  (define-key helm-map (kbd "C-b") 'delete-backward-char)
  (define-key helm-map (kbd "C-h") 'helm-next-line)
  (define-key helm-map (kbd "C-t") 'helm-previous-line))

(with-eval-after-load 'helm-files
  (define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
  (define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action))

(with-eval-after-load 'helm-swoop
  (define-key helm-swoop-map (kbd "C-r") 'helm-previous-line)
  (define-key helm-swoop-map (kbd "C-s") 'helm-next-line))

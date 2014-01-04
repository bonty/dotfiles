(require 'helm)
(require 'helm-config)
(helm-mode t)

(defun my-helm ()
  (interactive)
  (helm :sources '(
                   helm-c-source-buffers-list
                   helm-c-source-recentf
                   helm-c-source-files-in-current-dir
                   helm-c-source-mac-spotlight
                   helm-c-source-buffer-not-found)
        :buffer "*my helm*"))

(global-set-key (kbd "C-x b") 'my-helm)
(global-set-key (kbd "M-x") 'helm-M-x)

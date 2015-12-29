;; el-get-list-packages fullscreen
(defun my/el-get-list-packages-fullscreen (orig-fn &rest args)
  (window-configuration-to-register :el-get-list-packages-fullscreen)
  (apply orig-fn args)
  (delete-other-windows))

(defun my/el-get-list-packages-quit-session ()
  (interactive)
  (kill-buffer)
  (jump-to-register :el-get-list-packages-fullscreen))

(advice-add 'el-get-list-packages :around 'my/el-get-list-packages-fullscreen)

(with-eval-after-load 'el-get
  (define-key el-get-package-menu-mode-map (kbd "q") 'my/el-get-list-packages-quit-session))

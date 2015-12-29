;; make different same name file
(require 'uniquify)
(custom-set-variables
 '(uniquify-buffer-name-style 'post-forward-angle-brackets))

;; use ibuffer
(defalias 'list-buffers 'ibuffer)
(with-eval-after-load 'bs
  (fset 'bs-message-without-log 'ignore))

(global-set-key (kbd "M-]") 'bs-cycle-next)
(global-set-key (kbd "M-[") 'bs-cycle-previous)

;; automatically revert buffer
(global-auto-revert-mode t)

;; buffer-move.el
(global-set-key (kbd "M-g h") 'buf-move-left)
(global-set-key (kbd "M-g j") 'buf-move-down)
(global-set-key (kbd "M-g k") 'buf-move-up)
(global-set-key (kbd "M-g l") 'buf-move-right)

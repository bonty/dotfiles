;; git-gutter+
;; (require 'git-gutter-fringe+)
;; (global-git-gutter+-mode +1)
;; (global-set-key (kbd "C-x v u") 'git-gutter+)
;; (global-set-key (kbd "C-x v p") 'git-gutter+-stage-hunks)
;; (global-set-key (kbd "C-x v =") 'git-gutter+-popup-hunk)
;; (global-set-key (kbd "C-x v r") 'git-gutter+-revert-hunk)
;; (global-set-key (kbd "C-x v U") 'git-gutter+-unstage-whole-buffer)

;; (smartrep-define-key
;;     global-map "C-x" '(("p" . 'git-gutter+-previous-hunk)
;;                        ("n" . 'git-gutter+-next-hunk)))

;; magit
(custom-set-variables
 '(git-commit-fill-column 80)
 '(git-commit-summary-max-length 72)
 '(magit-push-always-verify nil))

(defun my/magit-advice-fullscreen (orig-fn &rest args)
  (window-configuration-to-register :magit-fullscreen)
  (apply orig-fn args)
  (delete-other-windows))

(defun my/magit-quit-session ()
  (interactive)
  (kill-buffer)
  (jump-to-register :magit-fullscreen))

(with-eval-after-load 'magit
  (global-git-commit-mode +1)
  (advice-add 'magit-status :around 'my/magit-advice-fullscreen)
  (advice-add 'magit-log :around 'my/magit-advice-fullscreen)
  (define-key magit-status-mode-map (kbd "q") 'my/magit-quit-session))

(global-set-key (kbd "C-c m") 'magit-status)

;; git-commit-mode
(defun my/git-commit-mode-hook ()
  (flyspell-mode +1))

(with-eval-after-load 'git-commit
  (add-hook 'git-commit-mode-hook 'my/git-commit-mode-hook))

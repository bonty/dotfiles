;; flycheck
(custom-set-variables
 '(flycheck-display-errors-delay 0.5)
 '(flycheck-idle-change-delay 1.0)
 '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages))

(defun my/flycheck-list-errors ()
  (interactive)
  (unless (bound-and-true-p flycheck-mode)
    (flycheck-mode +1)
    (flycheck-pos-tip-mode +1))
  (call-interactively 'flycheck-list-errors))

(with-eval-after-load 'flycheck
  (smartrep-define-key
      flycheck-mode-map "C-c" '(("p" . 'flycheck-previous-error)
				("n" . 'flycheck-next-error))))

(global-set-key (kbd "C-c C-l") 'my/flycheck-list-errors)

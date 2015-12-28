;; auto-complete
(ac-config-default)

(defvar my/auto-complete-enabled-modes
  '(csharp-mode
    git-commit-mode
    coffee-mode
    markdown-mode
    fundamental-mode
    org-mode
    text-mode))

(dolist (mode my/auto-complete-enabled-modes)
  (add-to-list 'ac-modes mode))

(custom-set-variables
 `(ac-dictionary-directories ,(concat user-emacs-directory "ac-dict"))
 '(ac-use-fuzzy t)
 '(ac-use-menu-map t)
 '(ac-delay 0.1)
 '(ac-auto-show-menu 0.2))

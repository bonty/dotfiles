(with-eval-after-load 'magit
  (set-face-foreground 'magit-diff-add "green")
  (set-face-foreground 'magit-diff-del "red")
  (set-face-foreground 'magit-diff-file-header "#00FFFF")
  (set-face-foreground 'magit-diff-hunk-header "#00AADD")
  (set-face-foreground 'magit-section-title "#FF00FF")

  (set-face-background 'magit-item-highlight "black")
  (set-face-background 'magit-diff-add "black")
  (set-face-background 'magit-diff-del "black")
  (set-face-background 'magit-diff-file-header "black")
  (set-face-background 'magit-diff-hunk-header "black")
  (set-face-background 'magit-section-title "black"))

(global-set-key (kbd "C-x m") 'magit-status)
(global-set-key (kbd "C-x v l") 'magit-log)

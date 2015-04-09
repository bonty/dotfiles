(add-to-list 'magic-mode-alist '("\\(.\\|\n\\)*\n@implementation" . objc-mode))
(add-to-list 'magic-mode-alist '("\\(.\\|\n\\)*\n@interface" . objc-mode))
(add-to-list 'magic-mode-alist '("\\(.\\|\n\\)*\n@protocol" . objc-mode))

;; build and run via AppleScript
(defun my/xcode-run-app ()
  (interactive)
  (shell-command (format "osascript %s/scripts/xcode-run-app.scpt" user-emacs-directory)))

(add-hook 'objc-mode-hook
          (lambda ()
            (define-key objc-mode-map (kbd "C-c C-r") 'my/xcode-run-app)))

(with-eval-after-load 'omnisharp
  ;; omnisharp-server installed by homebrew
  (setq omnisharp-server-executable-path (expand-file-name "/usr/local/opt/omnisharp-server/bin/Debug/OmniSharp.exe")))

(defun my/csharp-mode-hook ()
  (setq tab-width 4)
  (setq c-basic-offset tab-width)
  (c-set-offset 'substatement-open 0)
  (c-set-offset 'case-label '+)
  (c-set-offset 'arglist-intro '+)
  (c-set-offset 'arglist-close 0)
  (omnisharp-mode))

(add-hook 'csharp-mode-hook 'my/csharp-mode-hook)

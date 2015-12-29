;; view-mode
(key-chord-define-global "jk" 'view-mode)

(custom-set-variables
 '(view-read-only t))

(with-eval-after-load 'view
  (define-key view-mode-map (kbd "h") 'backward-char)
  (define-key view-mode-map (kbd "l") 'forward-char)
  (define-key view-mode-map (kbd "j") 'next-line)
  (define-key view-mode-map (kbd "k") 'previous-line)
  (define-key view-mode-map (kbd "S-SPC") 'scroll-up)
  (define-key view-mode-map (kbd " ") 'scroll-down)
  (define-key view-mode-map (kbd "f") 'forward-word)
  (define-key view-mode-map (kbd "b") 'backward-word))

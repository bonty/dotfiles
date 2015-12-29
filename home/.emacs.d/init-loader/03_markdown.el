;; markdown-mode
(add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))

(custom-set-variables
 '(markdown-indent-on-enter nil))

(with-eval-after-load 'markdown-mode
  (define-key markdown-mode-map (kbd "C-c C-c C-l") 'markdown-insert-link)
  (define-key markdown-mode-map (kbd "C-c C-c C-i") 'markdown-insert-image)

  (define-key gfm-mode-map (kbd "C-c C-c C-c") 'markdown-insert-gfm-code-block))

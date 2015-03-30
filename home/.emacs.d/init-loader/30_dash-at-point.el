(global-set-key (kbd "C-c d") 'dash-at-point)
(global-set-key (kbd "C-c e") 'dash-at-point-with-docset)

(add-to-list 'dash-at-point-mode-alist '(csharp-mode . "cs"))
(add-to-list 'dash-at-point-mode-alist '(c++-mode . "cpp"))
(add-to-list 'dash-at-point-mode-alist '(ruby-mode . "ruby"))

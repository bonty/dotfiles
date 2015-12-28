;; smartparens
(require 'smartparens-config)

(smartparens-global-mode)

;; rainbow delimiters
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

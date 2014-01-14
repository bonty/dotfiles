;; global
(define-key isearch-mode-map (kbd "C-k") 'isearch-edit-string)
(define-key global-map (kbd "C-c a") 'align)
(define-key global-map (kbd "C-c M-a") 'align-regexp)
(define-key global-map (kbd "C-c c") 'comment-region)
(define-key global-map (kbd "C-c u") 'uncomment-region)
(define-key global-map (kbd "C-c r") 'replace-string)
(define-key global-map (kbd "C-c i") 'indent-region)
(define-key global-map (kbd "C-\\") 'undo)
(define-key global-map (kbd "C-/") 'undo-tree-undo)
(define-key global-map (kbd "M-/") 'undo-tree-redo)
(define-key global-map (kbd "C-h") 'delete-backward-char)
(define-key global-map (kbd "C-c g") 'goto-line)
(define-key function-key-map [delete] (kbd "C-d"))
(define-key global-map (kbd "C-m") 'newline-and-indent)
(define-key global-map (kbd "C-a") 'beginning-of-indented-line)
(define-key global-map (kbd "C-x C-s") 'save-buffer-with-delete-trailing-whitespace)

;; flymake
(define-key global-map (kbd "C-c C-n") 'flycheck-tip-cycle)
(define-key global-map (kbd "C-c C-p") 'flycheck-tip-cycle-reverse)

;; direx
(define-key global-map (kbd "C-x C-j") 'direx:jump-to-project-directory)
(define-key direx:direx-mode-map (kbd "TAB") 'direx:maybe-find-node)

;; expand-region
(global-set-key (kbd "C-,") 'er/expand-region)
(global-set-key (kbd "C-M-,") 'er/contract-region)

;; helm
(global-set-key (kbd "C-x b") 'my-helm)
(global-set-key (kbd "M-x") 'helm-M-x)

(define-key helm-map (kbd "C-h") 'delete-backward-char)

;; multiple-cursors
(global-set-key (kbd "<C-M-return>") 'mc/edit-lines)

;; smartrep
(smartrep-define-key
 global-map "C-." '(("C-n" . 'mc/mark-next-like-this)
                    ("C-p" . 'mc/mark-previous-like-this)
                    ("*" . 'mc/mark-all-like-this)))


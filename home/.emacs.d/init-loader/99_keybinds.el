;; save buffer with deleting trailing whitespace
(defun my/save-buffer-with-delete-trailing-whitespace ()
  "save buffer with deleting trailing whitespace"
  (interactive)
  (delete-trailing-whitespace)
  (save-buffer))

;; move beginning of indented line
;; @see http://d.hatena.ne.jp/gifnksm/20100131/1264956220
(defun my/beginning-of-indented-line (current-point)
  "move beginning of indented line"
  (interactive "d")
  (let ((vhead-pos (save-excursion (progn (beginning-of-visual-line) (point))))
        (head-pos (save-excursion (progn (beginning-of-line) (point)))))
    (cond
     ;; when current pos is first visual line
     ((eq vhead-pos head-pos)
      (if (string-match
           "^[ \t]+$"
           (buffer-substring-no-properties vhead-pos current-point))
          (beginning-of-visual-line)
        (back-to-indentation)))
     ;; when current pos is head of second visual line
     ((eq vhead-pos current-point)
      (backward-char)
      (beginning-of-visual-indented-line (point)))
     ;; when current pos is second visual line
     (t (beginning-of-visual-line)))))

;; edit
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-m") 'newline-and-indent)
(global-set-key (kbd "C-j") 'newline)

(global-set-key (kbd "C-c r") 'replace-string)

(global-set-key (kbd "C-c a") 'align)
(global-set-key (kbd "C-c M-a") 'align-regexp)

;; cursor move
(global-set-key (kbd "C-a") 'my/beginning-of-indented-line)
(global-set-key (kbd "C-c g") 'goto-line)

;; buffer
(global-set-key (kbd "C-x C-s") 'my/save-buffer-with-delete-trailing-whitespace)

;; region
(global-set-key (kbd "C-c c") 'comment-region)
(global-set-key (kbd "C-c u") 'uncomment-region)
(global-set-key (kbd "C-c i") 'indent-region)

;; expand-region
(global-set-key (kbd "C-,") 'er/expand-region)
(global-set-key (kbd "C-M-,") 'er/contract-region)

;; helm binding
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x C-i") 'helm-imenu)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-mini)

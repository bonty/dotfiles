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

;; meta key
(global-set-key (kbd "C-w") 'ESC-prefix)

;; edit
(global-set-key (kbd "C-b") 'delete-backward-char)
(global-set-key (kbd "C-f") 'delete-char)
(global-set-key (kbd "M-f") 'kill-word)

(global-set-key (kbd "C-y") 'kill-region)
(global-set-key (kbd "C-p") 'yank)

(global-set-key (kbd "C-c r") 'replace-string)

(global-set-key (kbd "C-c a") 'align)
(global-set-key (kbd "C-c M-a") 'align-regexp)

;; cursor move
(global-set-key (kbd "C-d") 'backward-char)
(global-set-key (kbd "C-h") 'next-line)
(global-set-key (kbd "C-t") 'previous-line)
(global-set-key (kbd "C-n") 'forward-char)

(global-set-key (kbd "M-d") 'backward-word)
(global-set-key (kbd "M-h") 'scroll-down-command)
(global-set-key (kbd "M-t") 'scroll-up-command)
(global-set-key (kbd "M-n") 'forward-word)

(global-set-key (kbd "C-a") 'my/beginning-of-indented-line)
(global-set-key (kbd "C-c g") 'goto-line)

;; buffer
(global-set-key (kbd "C-x C-s") 'my/save-buffer-with-delete-trailing-whitespace)

;; region
(global-set-key (kbd "C-c c") 'comment-region)
(global-set-key (kbd "C-c u") 'uncomment-region)
(global-set-key (kbd "C-c i") 'indent-region)

;; expand-region
(global-set-key (kbd "C-v") 'er/expand-region)
(global-set-key (kbd "M-v") 'er/contract-region)

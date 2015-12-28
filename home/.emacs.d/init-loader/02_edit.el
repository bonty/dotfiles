;; comment binding
(global-set-key (kbd "C-c c") 'comment-region)
(global-set-key (kbd "C-c u") 'uncomment-region)

;; indent binding
(global-set-key (kbd "C-c i") 'indent-region)

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

(global-set-key (kbd "C-a") 'my/beginning-of-indented-line)

;; go to line
(global-set-key (kbd "C-c g") 'goto-line)

;; smart newline
(smart-newline-mode 1)

;; expand-region
(global-set-key (kbd "C-.") 'er/expand-region)
(global-set-key (kbd "C-,") 'er/contract-region)

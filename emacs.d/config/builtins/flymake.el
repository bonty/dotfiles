;; -*- mode: emacs-lisp ; coding: utf-8 -*-

(require 'flymake)

;; set warning face
(set-face-background 'flymake-errline "Red")
(set-face-foreground 'flymake-errline "Black")
(set-face-background 'flymake-warnline "Yellow")
(set-face-foreground 'flymake-warnline "Black")

;; display error in minibuffer
(defun flymake-display-err-minibuf
  "Displays the error/warning for the current line in the minibuffer"
  (interactive)
  (let* ((line-no (flymake-current-line-no))
         (line-err-info-list (nth 0 (flymake-find-err-info flymake-err-info line-no)))
         (count (length line-err-info-list)))
    (while (> count 0)
      (let* ((file (flymake-ler-file (nth (1- count) line-erro)))
             (full-file (flymake-ler-full-file (nth (1- count) line-err-info-list)))
             (text (flymake-ler-text (nth (1- count) line-err-info-list)))
             (line (flymake-ler-line (nth (1- count) line-err-info-list)))))
      (setq count (1- count)))))

;; C-c e => jump flymake error
(defun next-flymake-error ()
  (interactive)
  (flymake-goto-next-error)
  (let ((err (get-char-property (point) 'help-echo)))
    (when err
      (message err))))

(global-set-key (kbd "C-c e") 'next-flymake-error)

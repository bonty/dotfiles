(require 'fringe-helper)
(require 'flymake)
(require 'flycheck-tip)

;; disable default warning face
(set-face-background 'flymake-errline nil)
(set-face-foreground 'flymake-errline nil)
(set-face-background 'flymake-warnline nil)
(set-face-foreground 'flymake-warnline nil)

;; set flymake fringe warning face
(make-face 'my-flymake-warning-face)
(set-face-foreground 'my-flymake-warning-face "yellow")
(set-face-background 'my-flymake-warning-face "black")
(setq my-flymake-waring-face 'my-flymake-warning-face)

;; fringe warning
(defvar flymake-fringe-overlays nil)
(make-variable-buffer-local 'flymake-fringe-overlays)

(defadvice flymake-make-overlay (after add-to-fringe first
                                       (beg end tooltip-text face mouse-face)
                                       activate compile)
  (push (fringe-helper-insert-region
         beg end
         (fringe-lib-load (if (eq face 'flymake-errline)
                              fringe-lib-exclamation-mark
                            fringe-lib-question-mark))
         'left-fringe 'my-flymake-warning-face)
        flymake-fringe-overlays))

(defadvice flymake-delete-own-overlays (after remove-from-fringe activate
                                              compile)
  (mapc 'fringe-helper-remove flymake-fringe-overlays)
  (setq flymake-fringe-overlays nil))

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

(defvar my/flycheck-enable-modes
  '(ruby-mode))

(dolist (mode my/flycheck-enable-modes)
  (add-hook (intern (format "%s-hook" mode)) 'flycheck-mode))

(global-set-key (kbd "C-c C-n") 'flycheck-tip-cycle)
(global-set-key (kbd "C-c C-p") 'flycheck-tip-cycle-reverse)

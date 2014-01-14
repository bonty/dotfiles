(require 'direx)
(require 'direx-project)

(defun chomp (str)
  (replace-regexp-in-string "[\n\r]+$" "" str))

(defun git-project-p ()
  (string=
   (chomp
    (shell-command-to-string "git rev-parse --is-inside-work-tree"))
   "true"))

(defun git-root-directory ()
  (cond ((git-project-p)
         (chomp
          (shell-command-to-string "git rev-parse --show-toplevel")))
        (t
         "")))

(defun direx:jump-to-git-project-directory ()
  (interactive)
  (let* ((git-root-dir))
    (setq git-root-dir (git-root-directory))
    (unless (string= git-root-dir "")
      (direx:find-directory-noselect git-root-dir))
    (direx:jump-to-directory-other-window)))

(defun direx:jump-to-project-directory ()
  (interactive)
  (let ((result (ignore-errors
                  (direx-project:jump-to-project-root-other-window)
                  t)))
    (unless result
      (direx:jump-to-directory-other-window))))

(global-set-key (kbd "C-x C-j") 'direx:jump-to-project-directory)
(define-key direx:direx-mode-map (kbd "TAB") 'direx:maybe-find-node)

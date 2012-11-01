;; -*- mode: emacs-lisp; coding: utf-8 -*-

;; change variable to boolean value
(defun x->bool (elt) (not (not elt)))

;; autoload-if-found
;; @see http://www.sodan.org/~knagano/emacs/dotemacs.html
(defun autoload-if-found (function file &optional docstring interactive type)
  "set autoload iff. FILE has found."
  (and (locate-library file)
       (autoload function file docstring interactive type)))

;; load files
(defun load-directory-files (dir &optional regex)
  (let*
      ((regex (or regex ".+"))
       (files (and
               (file-accessible-directory-p dir)
               (directory-files dir 'full regex))))
    (mapc (lambda (file)
            (when (load file nil t)
              (message "`%s' loaded." file))) files)))

(defun kill-all-buffers ()
  "kill all buffers and save revive information"
  (interactive)
  (save-current-configuration)
  (dolist (buf (buffer-list))
    (if (not (string= "*scratch*" (buffer-name buf))) (kill-buffer buf))))

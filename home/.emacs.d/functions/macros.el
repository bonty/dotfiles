;; -*- mode: emacs-lisp ; coding: utf-8 -*-

;; eval-safe
;; usage: (eval-safe (some-suspicious-condition)) #nesting available
;; @see http://www.sodan.org/~knagano/emacs/dotemacs.html
(defmacro eval-safe (&rest body)
  `(condition-case err
       (progn ,@body)
     (error (message "[eval-safe] %s" err))))

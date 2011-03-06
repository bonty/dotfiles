;;
;; brackets.el
;;

(defvar my-brace-type-alist
  '(("braces" "{" "}")
    ("brackets" "[" "]")
    ("parens" "(" ")")
    ("single-quotation" "'" "'")
    ("double-quotation" "\"" "\"")
    ("back-quotation" "\`" "\`")))

(mapc
 (lambda (x)
   (fset (intern (concat "insert-" (car x)))
         #'(lambda ()
             (interactive)
             (let* ((func-name (replace-regexp-in-string
                                "insert-" "" (symbol-name this-command)))
                    (type (assoc func-name my-brace-type-alist))
                    (open (cadr type))
                    (close (caddr type)))
               (save-restriction
                 (if mark-active
                     (narrow-to-region (region-beginning) (region-end))
                   (narrow-to-region (point) (point)))
                 (goto-char (point-min))
                 (insert open)
                 (goto-char (point-max))
                 (insert close))
               (backward-char 1)))))
 my-brace-type-alist)

(provide 'brackets)
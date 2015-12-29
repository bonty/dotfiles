;; ruby
(defun helm-editutil-robe-completing-read (prompt choices &optional predicate require-match)
  (let ((collection (mapcar (lambda (c) (if (listp c) (car c) c)) choices)))
    (helm-comp-read prompt collection :test predicate :must-match require-match)))

(custom-set-variables
 '(ruby-deep-indent-paren nil)
 '(ruby-insert-encoding-magic-comment nil)
 '(robe-completing-read-func #'helm-robe-completing-read)
 '(robe-highlight-capf-candidates nil))

(defun my/ruby-mode-hook ()
  (setq flycheck-checker 'ruby-rubocop)

  (robe-mode +1)
  (add-to-list 'ac-source 'ac-source-robe)
  (ruby-end-mode +1))

(with-eval-after-load 'ruby-mode
  (add-hook 'ruby-mode-hook 'my/ruby-mode-hook))

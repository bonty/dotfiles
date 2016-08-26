;; ruby
(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.cap$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("config.ru$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . enh-ruby-mode))

(defun helm-editutil-robe-completing-read (prompt choices &optional predicate require-match)
  (let ((collection (mapcar (lambda (c) (if (listp c) (car c) c)) choices)))
    (helm-comp-read prompt collection :test predicate :must-match require-match)))

(custom-set-variables
  '(enh-ruby-add-encoding-comment-on-save nil)
  '(enh-ruby-deep-indent-paren nil)
  '(enh-ruby-deep-indent-paren-style nil)
  '(enh-ruby-use-encoding-map nil)
  '(ruby-insert-encoding-magic-comment nil)
  '(robe-completing-read-func #'helm-robe-completing-read)
  '(robe-highlight-capf-candidates nil))

(defun my/ruby-mode-hook ()
  (setq flycheck-checker 'ruby-rubocop)

  (robe-mode +1)
  (add-to-list 'ac-source 'ac-source-robe)
  (ruby-end-mode +1))

(with-eval-after-load 'enh-ruby-mode
  (add-hook 'enh-ruby-mode-hook 'my/ruby-mode-hook))

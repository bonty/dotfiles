(add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))

(with-eval-after-load 'cc-mode
  (define-key c-mode-map (kbd "C-c t") 'ff-find-other-file)
  (define-key c++-mode-map (kbd "C-c t") 'ff-find-other-file)

  (require 'ac-c-headers))

;; enum class indentation
;; @see: http://stackoverflow.com/questions/6497374/emacs-cc-mode-indentation-problem-with-c0x-enum-class
(defun inside-class-enum-p (pos)
  "Checks if POS is within the braces of a C++ \"enum class\"."
  (ignore-errors
    (save-excursion
      (goto-char pos)
      (up-list -1)
      (backward-sexp 1)
      (looking-back "enum[ \t]+class[ \t]+[^}]*"))))

(defun align-enum-class (langelem)
  (if (inside-class-enum-p (c-langelem-pos langelem))
      0
    (c-lineup-topmost-intro-cont langelem)))

(defun align-enum-class-closing-brace (langelem)
  (if (inside-class-enum-p (c-langelem-pos langelem))
      '-
    '+))

(defun fix-enum-class ()
  "Setup `c++-mode' to better handle \"class enum\"."
  (add-to-list 'c-offsets-alist '(topmost-intro-cont . align-enum-class))
  (add-to-list 'c-offsets-alist
               '(statement-cont . align-enum-class-closing-brace)))

(add-hook 'c++-mode-hook 'fix-enum-class)

;; lambda function indentation
;; @see: http://stackoverflow.com/questions/23553881/emacs-indenting-of-c11-lambda-functions-cc-mode
(defun inside-lambda-function-p (pos)
  (ignore-errors
    (save-excursion
      (goto-char pos)
      ;; Detect "[...](" or "[...]{". preceded by "," or "(",
      ;;   and with unclosed brace.
      (looking-at ".*[(,][ \t]*\\[[^]]*\\][ \t]*[({][^}]*$"))))

(defadvice c-lineup-arglist (around my activate)
  "Improve indentation of continued C++11 lambda function opened as argument."
  (setq ad-return-value
        (if (and (equal major-mode 'c++-mode)
                 (inside-lambda-function-p (c-langelem-pos langelem)))
            0                           ; no additional indent
          ad-do-it)))                   ; default behavior

(defun my/c-mode-hook ()
  (c-set-style "stroustrup")
  (setq tab-width 4)
  (setq c-basic-offset tab-width)

  (c-set-offset 'member-init-intro 0)
  (c-set-offset 'inline-open 0)

  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-header-symbols t))

(add-hook 'c-mode-hook 'my/c-mode-hook)
(add-hook 'c++-mode-hook 'my/c-mode-hook)

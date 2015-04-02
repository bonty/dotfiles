(setq-default undo-no-redo t
              undo-limit 600000
              undo-strong-limit 900000)

(custom-set-variables
 '(undohist-ignored-files '("COMMIT_EDITMSG" "PULLREQ_EDITMGS")))

(require 'undohist)
(undohist-initialize)

(global-undo-tree-mode)
(define-key undo-tree-map (kbd "C-/") 'undo-tree-undo)
(define-key undo-tree-map (kbd "M-_") 'nil)

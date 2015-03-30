(setq-default undo-no-redo t
              undo-limit 600000
              undo-strong-limit 900000)

(require 'undohist)
(undohist-initialize)

(global-undo-tree-mode)
(define-key undo-tree-map (kbd "C-/") 'undo-tree-undo)
(define-key undo-tree-map (kbd "M-_") 'nil)

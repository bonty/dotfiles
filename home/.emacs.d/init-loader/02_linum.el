;; linum
(require 'linum-off)

(global-linum-mode t)

;; place right side
(defun linum-format-func (line)
  (let ((w (length (number-to-string (count-lines (point-min) (point-max))))))
    (propertize (format (format "%%%dd" w) line) 'face 'linum)))

(setq linum-format 'linum-format-func)

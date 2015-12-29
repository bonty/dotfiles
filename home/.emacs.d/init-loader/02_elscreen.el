;; elscreen
(elscreen-start)

(custom-set-variables
 '(elscreen-display-screen-number nil)
 '(elscreen-tab-display-kill-screen nil)
 '(elscreen-buffer-to-nickname-alist nil))

;; @see: https://github.com/syohex/emacs-editutil/blob/master/elscreen-editutil.el
(defun elscreen-editutil--convert-name (screen-name)
  (let ((case-fold-search nil))
    (cond ((string-match-p "Minibuf" screen-name)
           (replace-regexp-in-string "\\*Minibuf-\\w\\*" "" screen-name))
          (t screen-name))))

(defun elscreen-editutil-update-frame-title ()
  (interactive)
  (when (elscreen-screen-modified-p 'elscreen-frame-title-update)
    (cl-loop with sort-func = (lambda (a b) (< (car a) (car b)))
             with screen-list = (cl-copy-list (elscreen-get-screen-to-name-alist))
             for (index . name) in (sort screen-list sort-func)
             for status = (elscreen-status-label index)
             for name = (elscreen-editutil--convert-name name)
             collect (format "%d%s %s" index status name) into screen-names
             finally
             (set-frame-name (mapconcat #'identity screen-names " ")))))

(defun elscreen-editutil-clone-only-this-window ()
  (interactive)
  (call-interactively 'elscreen-clone)
  (delete-other-windows))

;; don't show tab number in mode line
(setq-default elscreen-mode-line-string nil)
(remove-hook 'elscreen-screen-update-hook 'elscreen-mode-line-update)
(add-hook 'elscreen-screen-update-hook 'elscreen-editutil-update-frame-title)
(elscreen-toggle-display-tab)

(global-set-key (kbd "C-z C-z") 'elscreen-toggle)
(global-set-key (kbd "C-z ,") 'elscreen-screen-nickname)
(global-set-key (kbd "C-z C-l") 'helm-elscreen)
(global-set-key (kbd "C-<tab>") 'elscreen-next)
(global-set-key (kbd "<C-S-ios-lefttab>") 'elscreen-previous)

(run-with-idle-timer 20 t 'elscreen-editutil-update-frame-title)

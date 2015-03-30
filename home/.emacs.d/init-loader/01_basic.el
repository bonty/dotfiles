(require 'cl-lib)

;; encoding
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8-unix)

;; do not show startup screen
(setq inhibit-startup-screen t)

;; ignore case at dabbrev
(custom-set-variables
 '(dabbrev-case-fold-search t)
 '(dabbrev-case-replace nil))

;; ignore case at read file/buffer
(setq read-file-name-completion-ignore-case t)
(setq read-buffer-completion-ignore-case t)

;; remove menu bar and tool bar
(menu-bar-mode -1)
(tool-bar-mode -1)

;; show line/column number
(line-number-mode t)
(column-number-mode t)

;; do not create backup files
(setq make-backup-files nil)
(setq delete-auto-save-files t)
(setq create-lockfiles nil)

;; delete
(delete-selection-mode t)

;; indent
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq indent-line-function 'indent-relative-maybe)

;; visit symbolic link
(setq find-file-visit-truename t)

;; comment style
(setq comment-style 'multi-line)

;; highlight
(show-paren-mode t)
(custom-set-variables
 '(show-paren-ring-bell-on-mismatch t))
(setq transient-mark-mode t)
(setq search-highlight t)
(setq lazy-highlight-initial-delay 0)
(setq query-replace-highlight t)

;; increase GC threshold
(setq gc-cons-threshold (* 128 1024 1024))

;; yes/no -> y/n
(defalias 'yes-or-no-p 'y-or-n-p)

;; run server
(require 'server)
(unless (server-running-p)
  (server-start))


;; buffer
;; make different same name file
(require 'uniquify)
(custom-set-variables
 '(uniquify-buffer-name-style 'post-forward-angle-blackets))

;; automatically revert buffer
(global-auto-revert-mode t)

;; save buffer with deleting trailing whitespace
(defun save-buffer-with-delete-trailing-whitespace ()
  "save buffer with deleting trailing whitespace"
  (interactive)
  (delete-trailing-whitespace)
  (save-buffer))



;; ;; migemo
;; (bundle! emacs-jp/migemo
;;   (with-eval-after-load-feature 'migemo
;;     (setq migemo-command "cmigemo")
;;     (setq migemo-options '("-q" "--emacs"))

;;     ;; install cmigemo by homebrew
;;     (setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")

;;     (setq migemo-user-dictionary nil)
;;     (setq migemo-regex-dictionary nil)
;;     (setq migemo-coding-system 'utf-8)
;;     (load-library "migemo")
;;     (migemo-init)))

;; ;; ;; helm
;; (custom-set-variables
;;  '(helm-input-idle-delay 0)
;;  '(helm-exit-idle-delay 0)
;;  '(helm-candidate-number-limit 500)
;;  '(helm-boring-file-regexp-list '("~$"))
;;  '(helm-mini-default-sources '(helm-source-buffers-list
;;                                helm-source-recentf
;;                                ;; helm-source-ls-git
;;                                helm-source-files-in-current-dir
;;                                helm-source-mac-spotlight
;;                                helm-source-buffer-not-found)))

;; (bundle! helm
;;   (with-eval-after-load-feature 'helm-config
;;     (helm-mode t))

;;   (with-eval-after-load-feature 'helm
;;     (global-set-key (kbd "C-x b") 'helm-mini)
;;     (global-set-key (kbd "M-x") 'helm-M-x)
;;     (global-set-key (kbd "M-y") 'helm-show-kill-ring)
;;     (define-key helm-map (kbd "C-h") 'delete-backward-char))

;;   (with-eval-after-load-feature 'helm-files
;;     (define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
;;     (define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)))

;; ;; (bundle! helm-descbinds
;; ;;   (with-eval-after-load-feature 'helm-descbinds
;; ;;     (helm-descbinds-mode)))

;; ;; ;; (el-get-bundle! helm-ls-git)

;; ;; (bundle! helm-migemo
;; ;;   (with-eval-after-load-feature 'helm-migemo
;; ;;     (setq helm-use-migemo t)))

;; (bundle! helm-swoop
;;   (with-eval-after-load-feature 'helm-swoop
;;     (define-key helm-swoop-map (kbd "C-r") 'helm-previous-line)
;;     (define-key helm-swoop-map (kbd "C-s") 'helm-next-line)))
;; ;; ;; (el-get-bundle! ace-isearch)


;; elisp
;; jump to definition
(find-function-setup-keys)

;; eldoc
(dolist (hook '(emacs-lisp-mode-hook
                lisp-interaction-mode-hook
                eval-expression-minibuffer-setup-hook))
  (add-hook hook 'eldoc-mode))

(with-eval-after-load 'eldoc
  (set-face-attribute 'eldoc-highlight-function-argument nil
                      :underline t :foreground "green"
                      :weight 'bold))

;; keybind
;; deletion
(global-set-key (kbd "C-h") 'delete-backward-char)

;; buffer
(global-set-key (kbd "C-x C-s") 'save-buffer-with-delete-trailing-whitespace)

;; region
(global-set-key (kbd "C-c c") 'comment-region)
(global-set-key (kbd "C-c u") 'uncomment-region)
(global-set-key (kbd "C-c i") 'indent-region)

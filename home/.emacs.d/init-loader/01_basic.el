(require 'cl-lib)
(require 'generic-x)

;; encoding
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8-unix)

;; basic coloring
(global-font-lock-mode t)

;; do not show startup screen
(setq inhibit-startup-screen t)

;; ignore case at dabbrev
(custom-set-variables
 '(dabbrev-case-fold-search t)
 '(dabbrev-case-replace nil))

;; ignore case at read file/buffer
(setq read-file-name-completion-ignore-case t)
(setq read-buffer-completion-ignore-case t)

;; remove menu bar
(menu-bar-mode -1)

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

;; which func
(which-function-mode t)

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


;; linum
(global-linum-mode t)
(defun linum-format-func (line)
  (let ((w (length (number-to-string (count-lines (point-min) (point-max))))))
    (propertize (format (format "%%%dd " w) line) 'face 'linum)))
(setq linum-format 'linum-format-func)


;; buffer
;; make different same name file
(require 'uniquify)
(custom-set-variables
 '(uniquify-buffer-name-style 'post-forward-angle-blackets))

;; automatically revert buffer
(global-auto-revert-mode t)


;; disable electric-indent-mode
(defvar my/disable-electric-indent-modes
  '(markdown-mode
    yaml-mode))

(dolist (mode my/disable-electric-indent-modes)
  (add-hook (intern (format "%s-hook" mode)) (lambda () (electric-indent-local-mode -1))))


;; autopair
(defvar my/autopair-enabled-modes
  '(emacs-lisp-mode
    c-mode
    c++-mode
    java-mode
    groovy-mode
    python-mode
    ruby-mode
    sh-mode
    js2-mode
    cmake-mode
    coffee-mode
    lua-mode))

(dolist (mode my/autopair-enabled-modes)
  (add-hook (intern (format "%s-hook" mode)) 'autopair-mode))


;; undo-tree
(setq-default undo-no-redo t
              undo-limit 600000
              undo-strong-limit 900000)

(global-undo-tree-mode)
(define-key undo-tree-map (kbd "C-/") 'undo-tree-undo)
(define-key undo-tree-map (kbd "M-_") 'nil)


;; auto-save-buffers-enhanced
(setq auto-save-buffers-enhanced-exclude-regexps '("^COMMIT_EDITMSG"))
(setq auto-save-buffers-enhanced-quiet-save-p t)
(auto-save-buffers-enhanced t)


;; migemo
(setq migemo-command "cmigemo")
(setq migemo-options '("-q" "--emacs"))

;; install cmigemo by homebrew
(setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")

(setq migemo-user-dictionary nil)
(setq migemo-regex-dictionary nil)
(setq migemo-coding-system 'utf-8)
(load-library "migemo")
(migemo-init)


;; helm
(custom-set-variables
 '(helm-input-idle-delay 0)
 '(helm-exit-idle-delay 0)
 '(helm-candidate-number-limit 500)
 '(helm-boring-file-regexp-list '("~$"))
 '(helm-mini-default-sources '(helm-source-buffers-list
                               helm-source-recentf
                               ;; helm-source-ls-git
                               helm-source-files-in-current-dir
                               helm-source-mac-spotlight
                               helm-source-buffer-not-found)))

(helm-mode t)

(with-eval-after-load 'helm
  (helm-descbinds-mode)

  (global-set-key (kbd "C-x b") 'helm-mini)
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "M-y") 'helm-show-kill-ring)
  (define-key helm-map (kbd "C-h") 'delete-backward-char))

(with-eval-after-load 'helm-files
  (define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
  (define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action))

(require 'helm-migemo)
(eval-after-load "helm-migemo"
  '(defun helm-compile-source--candidates-in-buffer (source)
     (helm-aif (assoc 'candidates-in-buffer source)
         (append source
                 `((candidates
                    . ,(or (cdr it)
                           (lambda ()
                             ;; Do not use `source' because other plugins
                             ;; (such as helm-migemo) may change it
                             (helm-candidates-in-buffer (helm-get-current-source)))))
                   (volatile) (match identity)))
       source)))

(with-eval-after-load 'helm-swoop
  (define-key helm-swoop-map (kbd "C-r") 'helm-previous-line)
  (define-key helm-swoop-map (kbd "C-s") 'helm-next-line))


;; auto-complete
(ac-config-default)

(defvar my/auto-complete-enabled-modes
  '(git-commit-mode
    coffee-mode
    markdown-mode
    fundamental-mode
    text-mode))

(dolist (mode my/auto-complete-enabled-modes)
  (add-to-list 'ac-modes mode))

(custom-set-variables
 `(ac-dictionary-directories ,(concat user-emacs-directory "ac-dict"))
 '(ac-use-fuzzy t)
 '(ac-use-menu-map t)
 '(ac-delay 0.1)
 '(ac-auto-show-menu 0.2))


;; popwin
(require 'popwin)

(custom-set-variables
 '(display-buffer-function 'popwin:display-buffer)
 '(popwin:close-popup-window-timer-interval 0.5))

;; basic
(push '("*Completions*" :height 0.4) popwin:special-display-config)
(push '("*compilation*" :height 0.4 :noselect t :stick t) popwin:special-display-config)
(push '("*Help*" :height 0.5 :noselect t :stick t) popwin:special-display-config)

;; helm
(push '("helm" :regexp t :height 0.5) popwin:special-display-config)

;; direx
(push '(direx:direx-mode :position left :width 0.3 :dedicated t)
      popwin:special-display-config)

;; flycheck
(push '(flycheck-error-list-mode :stick t) popwin:special-display-config)


;; flymake
(custom-set-variables
 '(flycheck-display-errors-delay 0.5))

(defvar my/flycheck-enable-modes
  '(coffee-mode
    ruby-mode))

(defsubst my/flycheck-enable-mode-p (mode)
  (memq mode my/flycheck-enable-modes))

(defsubst my/flycheck-reset-function ()
  (setq flycheck-diplay-errors-function 'flycheck-display-error-messages))

(defun my/flycheck-list-errors ()
  (interactive)
  (setq flycheck-display-errors-function nil)
  (if (not (my/flycheck-enable-mode-p major-mode))
      (error "This mode can't use flycheck-mode")
    (when (or (not (boundp 'flycheck-mode)) (not flycheck-mode))
      (flycheck-mode +1))
    (call-interactively 'flycheck-list-errors)))

(defun my/toggle-flymake ()
  (interactive)
  (if (not (my/flycheck-enable-mode-p major-mode))
      (call-interactively 'flymake-mode)
    (call-interactively 'flycheck-mode)
    (my/flycheck-reset-function)))

(defun my/flymake-popup-error-message ()
  (interactive)
  (if (and (boundp 'flycheck-mode) flycheck-mode)
      (my/flycheck-reset-function)
    (let* ((line-no (line-number-at-pos))
           (cur-error-info (flymake-find-err-info flymake-err-info line-no))
           (line-err-info-list (nth 0 cur-error-info))
           (count (length line-err-info-list)))
      (while (> count 0)
        (when line-err-info-list
          (let* ((err-info (nth (1- count) line-err-info-list))
                 (file (flymake-ler-file err-info))
                 (full-file (flymake-ler-full-file err-info))
                 (text (flymake-ler-text err-info))
                 (line (flymake-ler-line err-info)))
            (popup-tip (format "[%s] %s" line text))))
        (decf count)))))

(defun my/flymake-goto-next-error (arg)
  (interactive "P")
  (if (and (boundp 'flycheck-mode) flycheck-mode)
      (flycheck-next-error arg)
    (flymake-goto-next-error)
    (my/flymake-popup-error-message)))

(defun my/flymake-goto-previous-error (arg)
  (interactive "P")
  (if (and (boundp 'flycheck-mode) flycheck-mode)
      (flycheck-previous-error arg)
    (flymake-goto-prev-error)
    (my/flymake-popup-error-message)))

(global-set-key (kbd "M-g M-n") 'my/flymake-goto-next-error)
(global-set-key (kbd "M-g M-p") 'my/flymake-goto-previous-error)


;; vcs
;; git-gutter
(global-git-gutter-mode +1)

(git-gutter:linum-setup)

(global-set-key (kbd "C-x v u") 'git-gutter)
(global-set-key (kbd "C-x v p") 'git-gutter:stage-hunk)
(global-set-key (kbd "C-x v =") 'git-gutter:popup-hunk)
(global-set-key (kbd "C-x v r") 'git-gutter:revert-hunk)

(add-hook 'focus-in-hook 'git-gutter:update-all-windows)

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
;; save buffer with deleting trailing whitespace
(defun my/save-buffer-with-delete-trailing-whitespace ()
  "save buffer with deleting trailing whitespace"
  (interactive)
  (delete-trailing-whitespace)
  (save-buffer))

;; move beginning of indented line
;; @see http://d.hatena.ne.jp/gifnksm/20100131/1264956220
(defun my/beginning-of-indented-line (current-point)
  "move beginning of indented line"
  (interactive "d")
  (let ((vhead-pos (save-excursion (progn (beginning-of-visual-line) (point))))
        (head-pos (save-excursion (progn (beginning-of-line) (point)))))
    (cond
     ;; when current pos is first visual line
     ((eq vhead-pos head-pos)
      (if (string-match
           "^[ \t]+$"
           (buffer-substring-no-properties vhead-pos current-point))
          (beginning-of-visual-line)
        (back-to-indentation)))
     ;; when current pos is head of second visual line
     ((eq vhead-pos current-point)
      (backward-char)
      (beginning-of-visual-indented-line (point)))
     ;; when current pos is second visual line
     (t (beginning-of-visual-line)))))

;; edit
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-m") 'newline-and-indent)
(global-set-key (kbd "C-j") 'newline)

;; cursor move
(global-set-key (kbd "C-a") 'my/beginning-of-indented-line)

;; buffer
(global-set-key (kbd "C-x C-s") 'my/save-buffer-with-delete-trailing-whitespace)

;; region
(global-set-key (kbd "C-c c") 'comment-region)
(global-set-key (kbd "C-c u") 'uncomment-region)
(global-set-key (kbd "C-c i") 'indent-region)

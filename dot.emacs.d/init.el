;; -* Mode: Emacs-Lisp ; Coding: utf-8 -*-

;; TODO


;; Common Lisp exstensions for Emacs
(require 'cl nil t)


;;; Macros
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; eval-safe
;; usage: (eval-safe (some-suspicious-condition)) #nesting available
;; @see http://www.sodan.org/~knagano/emacs/dotemacs.html
(defmacro eval-safe (&rest body)
  `(condition-case err
       (progn ,@body)
     (error (message "[eval-safe] %s" err))))


;;; Functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; system-type predicates
;; @see http://github.com/elim/dotemacs/blob/master/init.el
(defun x->bool (elt) (not (not elt)))
(setq darwin-p  (eq system-type 'darwin)
      ns-p      (featurep 'ns)
      carbon-p  (eq window-system 'mac)
      linux-p   (eq system-type 'gnu/linux)
      colinux-p (when linux-p
                  (let ((file "/proc/modules"))
                    (and
                     (file-readable-p file)
                     (x->bool
                      (with-temp-buffer
                        (insert-file-contents file)
                        (goto-char (point-min))
                        (re-search-forward "^cofuse\.+" nil t))))))
      cygwin-p  (eq system-type 'cygwin)
      nt-p      (eq system-type 'windows-nt)
      meadow-p  (featurep 'meadow)
      windows-p (or cygwin-p nt-p meadow-p))

;; autoload-if-found
;; @see http://www.sodan.org/~knagano/emacs/dotemacs.html
(defun autoload-if-found (function file &optional docstring interactive type)
  "set autoload iff. FILE has found."
  (and (locate-library file)
       (autoload function file docstring interactive type)))


;;; load-path
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; System
(let ((default-directory "~/.emacs.d/elisp/"))
  (setq load-path (cons default-directory load-path))
  (normal-top-level-add-subdirs-to-load-path))
;; (setq load-path (cons "/usr/local/share/emacs/site-lisp" load-path))


;;; exec-path
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;(setq exec-path (cons "~/.emacs.d/bin" exec-path))
(dolist (dir (list
              "/sbin"
              "/usr/sbin"
              "/bin"
              "/usr/bin"
              "/usr/local/bin"
              (expand-file-name "~/usr/bin")
              ))
 (when (and (file-exists-p dir) (not (member dir exec-path)))
   (setenv "PATH" (concat dir ":" (getenv "PATH")))
   (setq exec-path (append (list dir) exec-path))))

;; add shell $PATH to exec-path
;; @see http://d.hatena.ne.jp/sugyan/20100704/1278212225
;; (loop for x in (reverse
;;                 (split-string (substring (shell-command-to-string "echo $PATH") 0 -1) ":"))
;;       do (add-to-list 'exec-path x))

;; image-load-path
;; @see http://www.mail-archive.com/emacs-devel@gnu.org/msg10703.html
(when (eq window-system nil)
  (defvar image-load-path
    (list (file-name-as-directory (expand-file-name "images" data-directory))
          'data-directory 'load-path)
    "List of locations in which to search for image files.
    If an element is a string, it defines a directory to search.
    If an element is a variable symbol whose value is a string, that
    value defines a directory to search.
    If an element is a variable symbol whose value is a list, the
    value is used as a list of directories to search.")
  )


;;; Language Environment (default utf8)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(set-language-environment "Japanese")
(set-language-environment-coding-systems "Japanese")
(prefer-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8-unix)
(setq default-buffer-file-coding-system 'utf-8)
(setq local-coding-system 'utf-8)
(setq file-name-coding-system 'utf-8)
(setq default-file-name-coding-system 'utf-8)

;; (cond
;;  (windows-p ; local variables for windows (shift-jis)
;;   (setq file-name-coding-system 'sjis-dos)
;;   (setq default-file-name-coding-system 'sjis-dos))
;;  (t         ; default setting
;;   (setq file-name-coding-system 'utf-8)
;;   (setq default-file-name-coding-system 'utf-8)))

;; ;; Mapping wide character correctly (for Emacs22.x)
;; (if (< emacs-major-version 23)
;;     (utf-translate-cjk-set-unicode-range
;;      '((#x00a2 . #x00a3) (#x00a7 . #x00a8) (#x00ac . #x00ac)
;;        (#x00b0 . #x00b1) (#x00b4 . #x00b4) (#x00b6 . #x00b6)
;;        (#x00d7 . #x00d7) (#X00f7 . #x00f7) (#x0370 . #x03ff)
;;        (#x0400 . #x04FF) (#x2000 . #x206F) (#x2100 . #x214F)
;;        (#x2190 . #x21FF) (#x2200 . #x22FF) (#x2300 . #x23FF)
;;        (#x2500 . #x257F) (#x25A0 . #x25FF) (#x2600 . #x26FF)
;;        (#x2e80 . #xd7a3) (#xff00 . #xffef)
;;        )))


;;; Global Settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; hide startup message
(setq inhibit-startup-message t)

;; hide menubar and toolbar (eval-safe)
(when (eq window-system nil)
  (eval-safe (menu-bar-mode nil))
  (eval-safe (tool-bar-mode nil))
  )

;; hide scroll bar
(when window-system
  (eval-safe (scroll-bar-mode nil)))

;; disable visible bell
(setq visible-bell nil)

;; disable beep
(setq ring-bell-funciton '(lambda ()))

;; disable backup
(setq make-backup-files nil)

;; delete auto save file when quit
(setq delete-auto-save-files t)

;; show line num and column num
(line-number-mode t)
(column-number-mode t)

;; show file directory in mode line
(add-to-list 'global-mode-string '("" default-directory ""))

;; yes/no -> y/n
(fset 'yes-or-no-p 'y-or-n-p)

;; delete region when input something
(delete-selection-mode t)

;; set space indent (not tab)
(setq-default indent-tabs-mode nil)

;; set deafault tab width
;; (setq-default tab-width 8)

;; auto relative indent
(setq indent-line-function 'indent-relative-maybe)

;; hide password
(add-hook 'comint-output-filter-functions
          'comint-watch-for-password-prompt)

;; enable iswitchb mode
(iswitchb-mode t)

;; show newline code
(setq eol-mnemonic-dos "(CRLF)")
(setq eol-mnemonic-mac "(CR)")
(setq eol-mnemonic-unix "(LF)")

;; Command-Key and Option-Key (for Mac)
(when darwin-p
  (when ns-p
    (setq ns-command-modifier (quote meta))
    (setq ns-alternate-modifier (quote super))))

;; open file when file dragged
(when ns-p
  (define-key global-map [ns-drag-file] 'ns-find-file))

;; display filepath on title bar
(setq frame-title-format (format "%%f - Emacs@%s" (system-name)))

;; enable rectanble region
(setq cua-enable-cua-keys nil)
(cua-mode t)


;;; Highlight
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(show-paren-mode t)
(setq show-paren-ring-bell-on-mismatch t)
(setq transient-mark-mode t)
(setq search-highlight t)
(setq isearch-lazy-highlight-initial-delay 0)
(setq query-replace-highlight t)
(global-font-lock-mode t)

;;; sdic
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; @see http://d.hatena.ne.jp/derui/20100120/1263995789
(defun temp-cancel-read-only (function &optional jaspace-off)
  "eval temporarily cancel buffer-read-only
&optional t is turn of jaspace-mode"
  (let ((read-only-p nil)
        (jaspace-mode-p nil))
    (when (and jaspace-off jaspace-mode)
      (jaspace-mode)
      (setq jaspace-mode-p t))
    (when buffer-read-only
      (toggle-read-only)
      (setq read-only-p t))
    (eval function)
    (when read-only-p
      (toggle-read-only))
    (when jaspace-mode-p
      (jaspace-mode))))

(defun my-sdic-describe-word-with-popup (word &optional search-function)
  "Display the meaning of word."
  (interactive
   (let ((f (if current-prefix-arg (sdic-select-search-function)))
         (w (sdic-read-from-minibuffer)))
     (list w f)))
  (let ((old-buf (current-buffer))
        (dict-data))
    (set-buffer (get-buffer-create sdic-buffer-name))
    (or (string= mode-name sdic-mode-name) (sdic-mode))
    (erase-buffer)
    (let ((case-fold-search t)
          (sdic-buffer-start-point (point-min)))
      (if (prog1 (funcall (or search-function
                              (if (string-match "\\cj" word)
                                  'sdic-search-waei-dictionary
                                'sdic-search-eiwa-dictionary))
                          word)
            (set-buffer-modified-p nil)
            (setq dict-data (buffer-string))
            (set-buffer old-buf))
          (temp-cancel-read-only
           '(popup-tip dict-data :scroll-bar t :truncate nil))
        (message "Can't find word, \"%s\"." word))))
  )

(defadvice sdic-describe-word-at-point (around sdic-popup-advice activate)
  (letf (((symbol-function 'sdic-describe-word) (symbol-function 'my-sdic-describe-word-with-popup)))
    ad-do-it))

;; @see http://www.fugenji.org/~thomas/diary/index.php?no=r443
(when (autoload-if-found 'sdic-describe-word "sdic" "search word" t nil)
  (global-set-key (kbd "C-c W") 'sdic-describe-word))
(when (autoload-if-found 'sdic-describe-word-at-point "sdic" "カーソル位置の英単語の意味を調べる" t nil)
  (global-set-key (kbd "C-c w") 'sdic-describe-word-at-point))

;; ----- sdicが呼ばれたときの設定
(eval-after-load "sdic"
  '(progn
     ;; saryのコマンドをセットする
     (setq sdicf-array-command "/usr/local/bin/sary")
     ;; sdicファイルのある位置を設定し、arrayコマンドを使用するよう設定(現在のところ英和のみ)
     (setq sdic-eiwa-dictionary-list
           '((sdicf-client "/usr/local/share/dict/eijiro.sdic"
                           (strategy array)))
           sdic-waei-dictionary-list
           '((sdicf-client "/usr/local/share/dict/waeijiro.sdic"
                           (strategy array))))
     ;; saryを直接使用できるように sdicf.el 内に定義されているarrayコマンド用関数を強制的に置換
     (fset 'sdicf-array-init 'sdicf-common-init)
     (fset 'sdicf-array-quit 'sdicf-common-quit)
     (fset 'sdicf-array-search
           (lambda (sdic pattern &optional case regexp)
             (sdicf-array-init sdic)
             (if regexp
                 (signal 'sdicf-invalid-method '(regexp))
               (save-excursion
                 (set-buffer (sdicf-get-buffer sdic))
                 (delete-region (point-min) (point-max))
                 (apply 'sdicf-call-process
                        sdicf-array-command
                        (sdicf-get-coding-system sdic)
                        nil t nil
                        (if case
                            (list "-i" pattern (sdicf-get-filename sdic))
                          (list pattern (sdicf-get-filename sdic))))
                 (goto-char (point-min))
                 (let (entries)
                   (while (not (eobp)) (sdicf-search-internal))
                   (nreverse entries))))))
     ;; おまけ--辞書バッファ内で移動した時、常にバッファの一行目になるようにする
     (defadvice sdic-forward-item (after sdic-forward-item-always-top activate)
       (recenter 0))
     (defadvice sdic-backward-item (after sdic-backward-item-always-top activate)
       (recenter 0))))

(setq sdic-default-coding-system 'utf-8-unix)

;;; Font
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; @see http//d.hatena.ne.jp/antipop/20100126/1264493522
(when window-system
  (when (>= emacs-major-version 23)
    (set-face-attribute 'default nil
                        :family "Ricty"
                        :height 150)
    ))


;;; Keybind
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-key isearch-mode-map (kbd "C-k") 'isearch-edit-string)
(define-key global-map (kbd "C-c c") 'comment-region)
(define-key global-map (kbd "C-c u") 'uncomment-region)
(define-key global-map (kbd "C-c r") 'replace-string)
;; (define-key global-map (kbd "TAB") 'indent-region)
(define-key global-map (kbd "C-c i") 'indent-region)
(define-key global-map (kbd "C-\\") 'undo)
(define-key global-map (kbd "M-/") 'undo-tree-redo)
(define-key global-map (kbd "C-h") 'delete-backward-char)
;; (define-key global-map (kbd "C-x C-b") 'electric-buffer-list)
(define-key global-map (kbd "C-c g") 'goto-line)
(define-key function-key-map [delete] (kbd "C-d"))
(define-key global-map (kbd "C-m") 'newline-and-indent)
(define-key global-map (kbd "C-a") 'beginning-of-indented-line)

(when (eq window-system 'ns)
  ;; toggle fullscreen mode
  (define-key global-map (kbd "M-<RET>") 'ns-toggle-fullscreen))

;; move beginning of indented line
;; @see http://d.hatena.ne.jp/gifnksm/20100131/1264956220
(defun beginning-of-indented-line (current-point)
  "move beginning of indented line"
  (interactive "d")
  (when (>= emacs-major-version 23)
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

  (when (< emacs-major-version 23)
    (if (string-match
         "^[ \t]+$"
         (save-excursion
           (buffer-substring-no-properties
            (progn (beginning-of-line) (point))
            current-point)))
        (beginning-of-line)
      (back-to-indentation)))
  )


;;; auto-install.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(when (require 'auto-install nil t)
  (setq auto-install-directory "~/.emacs.d/elisp/")
  (auto-install-update-emacswiki-package-name t)
  (auto-install-compatibility-setup)
  (setq ediff-window-setup-function 'ediff-setup-windows-plain))


;;; auto-async-byte-complie.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(when (require 'auto-async-byte-complie nil t)
  (setq auto-async-byte-compile-exclude-files-regexp "/junk/")
  (add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-complie-mode))


;;; use modes
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq modes '(fundamental-mode-hook
              text-mode-hook
              perl-mode-hook
              cperl-mode-hook
              c-mode-hook
              c++-mode-hook
              java-mode-hook
              emacs-lisp-mode-hook
              js2-mode-hook
              ruby-mode-hook
              python-mode-hook
              py-mode-hook
              lisp-interaction-mode-hook
              lisp-mode-hook
              sh-mode-hook
              php-mode-hook
              ))


;;; auto-complete.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(when (require 'auto-complete-config nil t)
  (global-auto-complete-mode t)

  ;; keybind in complete window
  (define-key ac-completing-map (kbd "C-n") 'ac-next)
  (define-key ac-completing-map (kbd "C-p") 'ac-previous)
  (define-key ac-completing-map (kbd "M-/") 'ac-stop)

  ;; stop auto launch
  ;; (setq ac-auto-start nil)

  ;; set trigger key
  (ac-set-trigger-key "TAB")

  ;; default max candidate
  (setq ac-candidate-max 20))


;;; anything.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setenv "TEMPDIR" "~/.emacs.d/tmp")
(setq warning-suppress-types nil)

;; load anything.el settings
(when (require 'anything-startup nil t)

  (when (require 'anything-complete nil t)
    (anything-lisp-complete-symbol-set-timer 150)

    (setq anything-enable-shortcuts 'alphabet
          anything-sources
          (list anything-c-source-buffers
                anything-c-source-file-name-history
                anything-c-source-info-pages
                anything-c-source-man-pages
                anything-c-source-locate
                anything-c-source-emacs-commands
                anything-c-source-complete-shell-history
                ))

    (global-set-key (kbd "M-y") 'anything-show-kill-ring)

    (mapc '(lambda (key)
             (global-set-key key 'anything))
          (list
           [(control ?:)]
           [(control \;)]
           [(control x)(b)]
           [(control x)(control :)]
           [(control x)(control \;)])))

  ;; anything-dabbrev-expand
  (when (require 'anything-dabbrev-expand nil t)
    (global-set-key (kbd "C-o") 'anything-dabbrev-expand)
    (define-key anything-dabbrev-map (kbd "C-o") 'anything-dabbrev-find-all-buffers))

  ;; anything-c-moccur
  (when (require 'anything-c-moccur nil t)
    (setq moccur-split-word t)
    (global-set-key (kbd "M-s") 'anything-c-moccur-occur-by-moccur)
    (define-key isearch-mode-map (kbd "C-o") 'anything-c-moccur-from-isearch)
    (define-key isearch-mode-map (kbd "C-M-o") 'isearch-occur)
    )
  )


;;; Shell
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; multi-shell.el
(when (require 'multi-shell nil t)
  (setq multi-shell-revert-window-after-complete nil)
  (setq multi-shell-revert-window-keystroke (kbd "q"))
  )


;; display escape
(autoload-if-found 'ansi-color-for-comint-mode-on "ansi-color"
                   "Set `ansi-color-for-comint-mode' to t." t)

;; shell-mode keybind
(add-hook 'shell-mode-hook
          (lambda ()
            ; M-p/n complete history
            (define-key comint-mode-map (kbd "M-p") 'comint-previous-matching-input-from-input)
            (define-key comint-mode-map (kbd "M-n") 'comint-next-matching-input-from-input)
            ; M-r search history
            (define-key comint-mode-map (kbd "M-r") 'anything-complete-shell-history)
            (ansi-color-for-comint-mode-on))
          (setq tab-width 8))

;; save shell history (shell-history.el)
(require 'shell-history nil t)


;;; flymake.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(when (require 'flymake nil t)

  ;; set warning face
  (set-face-background 'flymake-errline "Red")
  (set-face-foreground 'flymake-errline "Black")
  (set-face-background 'flymake-warnline "Yellow")
  (set-face-foreground 'flymake-warnline "Black")

  ;; display error in minibuffer
  (defun flymake-display-err-minibuf
    "Displays the error/warning for the current line in the minibuffer"
    (interactive)
    (let* ((line-no (flymake-current-line-no))
           (line-err-info-list (nth 0 (flymake-find-err-info flymake-err-info line-no)))
           (count (length line-err-info-list)))
      (while (> count 0)
        (let* ((file (flymake-ler-file (nth (1- count) line-erro)))
               (full-file (flymake-ler-full-file (nth (1- count) line-err-info-list)))
               (text (flymake-ler-text (nth (1- count) line-err-info-list)))
               (line (flymake-ler-line (nth (1- count) line-err-info-list)))))
        (setq count (1- count)))))

  ;; C-c e => jump flymake error
  (defun next-flymake-error ()
    (interactive)
    (flymake-goto-next-error)
    (let ((err (get-char-property (point) 'help-echo)))
      (when err
        (message err))))
  (global-set-key (kbd "C-c e") 'next-flymake-error)

  ;; setting for perl
  ;; @see http://unknownplace.org/memo/2007/12/21#e001

  ;; set-perl5lib
  ;; @see http://svn.coderepos.org/share/lang/elisp/set-perl5lib/set-perl5lib.el
  (require 'set-perl5lib nil t)

  (defvar flymake-perl-err-line-patterns
    '(("\\(.*\\) at \\([^ \n]+\\) line \\([0-9]+\\)[,.\n]" 2 3 nil 1)))

  (defconst flymake-allowed-perl-file-name-masks
    '(("\\.pl$" flymake-perl-init)
      ("\\.pm$" flymake-perl-init)
      ("\\.t$" flymake-perl-init)))

  (defun flymake-perl-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "perl" (list "-wc" local-file))))

  (defun flymake-perl-load ()
    (interactive)
    (defadvice flymake-post-syntax-check (before flymake-force-check-was-interrupted)
      (setq flymake-check-was-interrupted t))
    (ad-activate 'flymake-post-syntax-check)
    (setq flymake-allowed-file-name-masks (append flymake-allowed-file-name-masks flymake-allowed-perl-file-name-masks))
    (setq flymake-err-line-patterns flymake-perl-err-line-patterns)
    (set-perl5lib)
    (flymake-mode t))

  (add-hook 'cperl-mode-hook '(lambda () (flymake-perl-load)))

  ;; setting for C
  (defun flymake-c-init ()
    (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                         'flymake-create-temp-inplace))
           (local-file  (file-relative-name
                         temp-file
                         (file-name-directory buffer-file-name))))
      (list "gcc" (list "-Wall" "-Wextra" "-fsyntax-only" local-file))))

  (push '("\\.c$" flymake-c-init) flymake-allowed-file-name-masks)

  (add-hook 'c-mode-hook '(lambda () (flymake-mode t)))


  ;; setting for C++
  (defun flymake-cc-init ()
    (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                         'flymake-create-temp-inplace))
           (local-file  (file-relative-name
                         temp-file
                         (file-name-directory buffer-file-name))))
      (list "g++" (list "-Wall" "-Wextra" "-fsyntax-only" local-file))))

  (push '("\\.cpp$" flymake-cc-init) flymake-allowed-file-name-masks)

  (add-hook 'c++-mode-hook '(lambda () (flymake-mode t)))
  )


;;; zencoding-mode.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(when (require 'zencoding-mode nil t)
  (add-hook 'sgml-mode-hook 'zencoding-mode)
  (add-hook 'html-mode-hook 'zencoding-mode)
  (add-hook 'text-mode-hook 'zencoding-mode)
  (define-key zencoding-mode-keymap (kbd "C-z") 'zencoding-expand-line))


;;;;; yasnipet.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(when (require 'yasnippet-config nil t)
  (yas/setup "~/.emacs.d/elisp/"))


;;; smartchr.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (when (require 'smartchr nil t)
;;   (dolist (lang modes)
;;     (add-hook lang (lambda ()
;;                      (define-key (current-local-map) (kbd "=") (smartchr '("=" " = " " == ")))
;;                      (define-key (current-local-map) (kbd ">") (smartchr '(">" ">>" " => " " => \'`!!'\'" " => \"`!!'\"")))
;;                      )))
;;   )


;;; view-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(when (require 'viewer nil t)
  (viewer-stay-in-setup)
  (setq viewer-modeline-color-unwritable "tomato")
  (setq viewer-modeline-color-view "orange")
  (viewer-change-modeline-color-setup))

(setq view-read-only t)
(defvar pager-keybind
  `( ;; vi-like
    ("h" . backward-word)
    ("l" . forward-word)
    ("j" . next-line)
    ("k" . previous-line)
    (";" . gene-word)
    ("b" . scroll-down)
    (" " . scroll-up)
    ;; w3m-like
    ("m" . gene-word)
    ("i" . win-delete-current-window-and-squeeze)
    ("w" . forward-word)
    ("e" . backward-word)
    ("(" . point-undo)
    (")" . point-redo)
    ("J" . ,(lambda () (interactive) (scroll-up 1)))
    ("K" . ,(lambda () (interactive) (scroll-down 1)))
    ;; langhelp-like
    ("c" . scroll-other-window-down)
    ("v" . scroll-other-window)
    ))
(defun define-many-keys (keymap key-table &optional includes)
  (let (key cmd)
    (dolist (key-cmd key-table)
      (setq key (car key-cmd)
            cmd (cdr key-cmd))
      (if (or (not includes) (member key includes))
          (define-key keymap key cmd))))
  keymap)

(defun view-mode-hook0 ()
  (define-many-keys view-mode-map pager-keybind)
  (hl-line-mode 1)
  (define-key view-mode-map " " 'scroll-up))
(add-hook 'view-mode-hook 'view-mode-hook0)

;; open read-only file in view-mode
(defadvice find-file
  (around find-file-switch-to-view-file (file &optional wild) activate)
  (if (and (not (file-writable-p file))
           (not (file-directory-p file)))
      (view-file file)
    ad-do-it))
;; dont leave view-mode when read-only
(defvar view-mode-force-exit nil)
(defmacro do-not-exit-view-mode-unless-writable-advice (f)
  `(defadvice ,f (around do-not-exit-view-mode-unless-writable activate)
     (if (and (buffer-file-name)
              (not view-mode-force-exit)
              (not (file-writable-p (buffer-file-name))))
         (message "File is unwritable, so stay in view-mode.")
       ad-do-it)))

(do-not-exit-view-mode-unless-writable-advice view-mode-exit)
(do-not-exit-view-mode-unless-writable-advice view-mode-disable)


;;; Perl
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; cperl-mode
(when (require 'cperl-mode nil t)
  ;; apply cperl-mode
  (add-to-list 'auto-mode-alist '("\\.\\([pP][Llm]\\|al\\|t\\|cgi\\)\\'" . cperl-mode))
  (add-to-list 'interpreter-mode-alist '("perl" . cperl-mode))
  (add-to-list 'interpreter-mode-alist '("perl5" . cperl-mode))
  (add-to-list 'interpreter-mode-alist '("miniperl" . cperl-mode))

  ;; don't use perl-mode
  (defalias 'perl-mode 'cperl-mode)

  ;; coding style
  (setq cperl-close-paren-offset -2)
  (setq cperl-continued-statement-offset 2)
  (setq cperl-indent-level 2)
  (setq cperl-indent-parens-as-block t)
  (setq cperl-label-offset -2)
  (setq cperl-highlight-variables-indiscriminately t)
  (setq cperl-tab-always-indent t)
  (setq cperl-fontlock t)

  ;; color settings
  (set-face-bold-p 'cperl-array-face nil)
  (set-face-background 'cperl-array-face nil)
  (set-face-bold-p 'cperl-hash-face nil)
  (set-face-italic-p 'cperl-hash-face nil)
  (set-face-background 'cperl-hash-face nil)

  (add-hook 'cperl-mode-hook
            '(lambda()
               (progn
                 ;; perl-completion
                 (setq plcmp-use-keymap nil)
                 (when (require 'perl-completion nil t)
                   (add-to-list 'ac-sources 'ac-source-perl-completion)
                   (perl-completion-mode t)

                   ;; keybind
                   (define-key plcmp-mode-map (kbd "C-M-d") 'plcmp-cmd-show-doc)
                   (define-key plcmp-mode-map (kbd "C-M-p") 'plcmp-cmd-show-doc-at-point)
                   (define-key plcmp-mode-map (kbd "C-M-m") 'plcmp-cmd-menu)
                   (define-key plcmp-mode-map (kbd "C-M-i") 'plcmp-cmd-smart-complete)
                   (define-key plcmp-mode-map (kbd "C-M-c") 'plcmp-cmd-clear-all-caches)
                   )
                 )))
  )


;;; JavaScript
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; js2-mode modified by mooz
;; @see https://github.com/mooz/js2-mode
(when (require 'js2-mode nil t)
  (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
  )


;;; C
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-hook 'c-mode-hook
          '(lambda()
             (progn
               ;; style
               (c-set-style "cc-mode")
               )))

;;; PHP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(when (require 'php-mode nil t)
  (add-to-list 'auto-mode-alist '("\\.php$" . php-mode))

  (add-hook 'php-mode-hook
            (lambda ()
              (require 'php-completion)
              (php-completion-mode t)
              (define-key php-mode-map (kbd "C-o") 'phpcmp-complete)
              (when (require 'auto-complete nil t)
                (make-variable-buffer-local 'ac-sources)
                (add-to-list 'ac-sources 'ac-source-php-completion)
                (auto-complete-mode t))))
  )


;;; YaTeX
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(when (autoload-if-found 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
  (setq load-path (cons (expand-file-name "/usr/share/emacs/site-lisp/yatex") load-path))
  (setq auto-mode-alist
        (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))

  (setq load-path (cons (expand-file-name "~/src/emacs/yatex") load-path))
  (setq tex-command "platex"
        dvi2-command "pxdvi"
        YaTeX-use-AMS-LaTeX t
        YaTeX-use-LaTeX2e t)

  (setq tex-command "platex"
        dviprint-command-format "pdvips -f %f %t %s | lpr"
        dviprint-from-format "-p %b"
        dviprint-to-format "-l %e"
        dvi2-command "pxdvi -geo +0+0 -s 4"
        section-name "documentclass")
  )

;;; load plugins
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; align
(require 'align nil t)

;; crosshairs.el
(when (require 'hl-line+ nil t)
  (defface hlline-face
    '((t (:background "Black")))
    "Face to use for `hl-line-face'."
    :group 'hl-line)
  (setq hl-line-face 'hlline-face)
  (global-hl-line-mode t)
  )

;; uniquify
(when (require 'uniquify nil t)
  (setq uniquify-buffer-name-style 'post-forward-angle-brackets)
  (setq uniquify-ignore-buffers-re "*[^*]+*"))

;; linum
(when (require 'linum nil t)
  (setq linum-format "%4d ")

  ;; define linum enable mode
  ;; @see http://macemacsjp.sourceforge.jp/index.php?CocoaEmacs#aae602ba
  (dolist (lang modes)
    (add-hook lang (lambda () (linum-mode t))))
  )

;; recentf-ext.el
(setq recentf-max-saved-items 500)
(setq recentf-exclude '("/TAGS$" "/var/tmp/"))
(require 'recentf-ext nil t)

;; brackets.el
(when (require 'brackets nil t)
  (dolist (lang modes)
    (add-hook lang (lambda ()
                     (define-key (current-local-map) "{" 'insert-braces)
                     (define-key (current-local-map) "(" 'insert-parens)
                     (define-key (current-local-map) "\"" 'insert-double-quotation)
                     (define-key (current-local-map) "\`" 'insert-back-quotation)
                     (define-key (current-local-map) "\'" 'insert-single-quotation)
                     (define-key (current-local-map) "[" 'insert-brackets)
                     )))
  )

;; tempbuf.el
(when (require 'tempbuf nil t)
  ;; (add-hook 'find-file-hooks 'turn-on-tempbuf-mode)
  (add-hook 'dired-mode-hook 'turn-on-tempbuf-mode)
  )

;; auto-save-buffers.el
;; @see http://0xcc.net/misc/auto-save/
(when (require 'auto-save-buffers nil t)
  (run-with-idle-timer 0.5 t 'auto-save-buffers))

;; autosave and resume all buffers (revive.el)
;; @see http://www.hasta-pronto.org/archives/2008/01/30-0235.php
(when (autoload-if-found 'save-current-configuration "revive" "Save status" t)
  (when (autoload-if-found 'resume "revive" "Resume Emacs" t)
    (when (autoload-if-found 'wipe "revive" "Wipe emacs" t)
      (define-key ctl-x-map "R" 'resume)                        ; C-x R resume
      (define-key ctl-x-map "K" 'wipe)                          ; C-x K kill
      (add-hook 'kill-emacs-hook 'save-current-configuration)   ; autosave when quit
      )))

;; mic-paren.el
;; highlight characteres between parenthesis
(when (require 'mic-paren nil t)
  (paren-activate)
  (setq paren-match-face 'bold)
  (setq paren-sexp-mode t)
  (setq paren-sexp-ignore-comments t))

;; sudo-ext.el
(server-start)
(require 'sudo-ext nil t)

;; key-chord.el
(when (require 'key-chord nil t)
  (setq key-chord-two-keys-delay 0.04)
  (key-chord-mode t)
  (key-chord-define-global "jk" 'view-mode))

;; ;; point-undo.el
;; (when (require 'point-undo nil t)
;;   (define-key global-map [f7] 'point-undo)
;;   (define-key global-map [S-f7] 'point-redo))

;; undo-tree.el
(when (require 'undo-tree nil t)
  (global-undo-tree-mode))

;; undohist.el
(when (require 'undohist nil t)
  (undohist-initialize))

;; color-moccur.el
(when (require 'color-moccur nil t)
  (setq moccur-split-word t))

;; doxygen.el
(when (require 'doxygen nil t)
  ;; C
  (define-key c-mode-map (kbd "C-c d f") 'doxygen-insert-function-comment)
  (define-key c-mode-map (kbd "C-c d F") 'doxygen-insert-file-comment)
  (define-key c-mode-map (kbd "C-c d m") 'doxygen-insert-member-group-region)
  (define-key c-mode-map (kbd "C-c d i") 'doxygen-insert-comment)
  (define-key c-mode-map (kbd "C-c d c") 'doxygen-insert-compound-comment)

  ;; C++
  (define-key c++-mode-map (kbd "C-c d f") 'doxygen-insert-function-comment)
  (define-key c++-mode-map (kbd "C-c d F") 'doxygen-insert-file-comment)
  (define-key c++-mode-map (kbd "C-c d m") 'doxygen-insert-member-group-region)
  (define-key c++-mode-map (kbd "C-c d i") 'doxygen-insert-comment)
  (define-key c++-mode-map (kbd "C-c d c") 'doxygen-insert-compound-comment)
  )

;; ;; c-doc.el
;; (when (require 'c-doc nil t)
;;   (custom-set-variables
;;    '(c-doc-mail-address "xxx@yyy.zzz")
;;    '(c-doc-author (format "XXX <%s>" c-doc-mail-address))
;;    '(c-doc-url "http://www.xxx.yyy"))

;;   (define-key c-mode-map (kbd "C-c d i") 'c-doc-insert)
;;   (define-key c++-mode-map (kbd "C-c d i") 'c-doc-insert)
;;   )

;;; Color settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Color Scheme
;; Black   #000000(0,0,0)       #000000(64,64,64)
;; Red     #ff6347(255,99,71)   #ff0000(255,64,64)
;; Green   #32cd32(0,255,0)     #00ff00(50,255,50)
;; Yellow  #ecc142(236,193,66)  #ffff00(255,255,0)
;; Blue    #87ceff(135,206,255) #00adff(128,162,255)
;; Magenta #ffa2ff(255,162,255) #ff00ff(255,0,255)
;; Cyan    #0000ff(0,255,255)   #a2ffff(162,255,255)
;; White   #f5f5f5(225,225,225) #ffffff(255,255,255)

(set-background-color "#313e32")
(set-foreground-color "#fff")
(set-cursor-color "#84ff84")

(set-face-foreground 'font-lock-builtin-face "#a6e22a");
(set-face-foreground 'font-lock-comment-delimiter-face "#75716e")
(set-face-foreground 'font-lock-comment-face "#75716e")
(set-face-foreground 'font-lock-constant-face "#ae81ff")
(set-face-foreground 'font-lock-doc-face "#e6db74")
(set-face-foreground 'font-lock-string-face "#e6db74")
(set-face-foreground 'font-lock-function-name-face "#a6e22e")
(set-face-foreground 'font-lock-keyword-face "#f92672")
(set-face-foreground 'font-lock-type-face "#89bdff")
(set-face-foreground 'font-lock-variable-name-face "#f92672")
(set-face-foreground 'font-lock-warning-face "#fd5ff1")
(set-face-background 'region "#49483e")
(set-face-background 'hl-line "#49483e")
(set-face-background 'highlight "#f92672")
(set-face-foreground 'highlight "#f8f8f0")
(set-face-background 'lazy-highlight "#49483e")
(set-face-background 'anything-match "#49483e")
(set-face-background 'isearch "#f92672")
(set-face-foreground 'isearch "#f8f8f0")
(set-face-foreground 'linum "#75716e")
(set-face-foreground 'modeline "#000")
(set-face-background 'modeline "#ffbf00")
(set-face-foreground 'mode-line-inactive "#75716e")
(set-face-background 'mode-line-inactive "#222322")
(set-face-foreground 'minibuffer-prompt "#0f0")

;; EOF ;;

;; el-get install
(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;; basic packages
(el-get-bundle emacs-jp/init-loader)
(el-get-bundle purcell/exec-path-from-shell)

;; load environment variables first
;; do this first because it cause flycheck install error
;; @see: http://blog.daich.org/2015/03/27/el-get-flycheck/
(custom-set-variables
 '(exec-path-from-shell-check-startup-files nil))
(exec-path-from-shell-copy-envs '("PATH"))

;; library
(el-get-bundle dash)

(add-to-list 'load-path (locate-user-emacs-file "el-get/dash"))

;; theme
(el-get-bundle color-theme-zenburn
  (add-to-list 'custom-theme-load-path default-directory))

;; auto-complete
(el-get-bundle auto-complete/popup-el :name popup)
(el-get-bundle auto-complete/fuzzy-el :name fuzzy)
(el-get-bundle auto-complete/auto-complete)

;; helm
(el-get-bundle helm)
(el-get-bundle helm-descbinds)
(el-get-bundle helm-ag)
(el-get-bundle helm-git-grep)
(el-get-bundle helm-ls-git)
(el-get-bundle helm-swoop)

;; smartrep
(el-get-bundle smartrep)

;; key-chord
(el-get-bundle key-chord)

;; linum
(el-get-bundle linum-off)

;; search
(el-get-bundle syohex/emacs-anzu :name anzu)

;; undo
(el-get-bundle undo-tree)
(el-get-bundle m2ym/undohist-el :name undohist)

;; smart newline
(el-get-bundle smart-newline)

;; cursor movement
;; (el-get-bundle winterTTr/ace-jump-mode)

;; paren
(el-get-bundle Fuco1/smartparens)
(el-get-bundle rainbow-delimiters)

;; region
(el-get-bundle expand-region)
;; (el-get-bundle multiple-cursors)

;; buffer
(el-get-bundle emacs-jp/elscreen)
(el-get-bundle m2ym/popwin-el :name popwin)
(el-get-bundle kentaro/auto-save-buffers-enhanced)
(el-get-bundle lukhas/buffer-move)
(el-get-bundle recentf-ext)

;; dired
(el-get-bundle syohex/emacs-dired-k :name dired-k)
;; (el-get-bundle dired-hacks)

;; flycheck
(el-get-bundle flycheck)
(el-get-bundle flycheck-pos-tip)

;; snippet
(el-get-bundle yasnippet)

;; git
(el-get-bundle magit)
(el-get-bundle helm-ghq)
;; (el-get-bundle git-gutter-fringe+)

;; open-junk-file
(el-get-bundle open-junk-file)

;; ruby
(el-get-bundle enh-ruby-mode)
(el-get-bundle ruby-block)
(el-get-bundle ruby-end)
(el-get-bundle inf-ruby)
(el-get-bundle dgutov/robe)

;; go
(el-get-bundle go-mode)

;; c
(el-get-bundle zk-phi/ac-c-headers)

;; elisp
(el-get-bundle elisp-slime-nav)

;; markdown
(el-get-bundle markdown-mode)

;; yaml
(el-get-bundle yaml-mode)

;; javascript
(el-get-bundle js2-mode)
(el-get-bundle coffee-mode)

;; dockerfile
(el-get-bundle dockerfile-mode)

;; groovy(for gradle)
(el-get-bundle groovy-emacs-mode)

;; lua
(el-get-bundle lua-mode)

;; nginx.conf
(el-get-bundle nginx-mode)

;; slim
(el-get-bundle slim-mode)

;; fluentd.conf
(el-get-bundle syohex/emacs-fluentd-mode :name fluentd-mode)

;; hashicorp configuration file
(el-get-bundle syohex/emacs-hcl-mode :name hcl-mode)
;; terraform
(el-get-bundle terraform-mode)

;; editorconfig
(el-get-bundle editorconfig)

;; shell
;; (el-get-bundle syohex/emacs-quickrun :name quickrun)

;; document
;; (el-get-bundle dash-at-point)

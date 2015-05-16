;; el-get install
(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))
(unless (require 'bundle nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;; add self-recipe path
(add-to-list 'el-get-recipe-path (locate-user-emacs-file "recipes"))

;; basic packages
(el-get-bundle emacs-jp/init-loader)
(el-get-bundle purcell/exec-path-from-shell)

(el-get-bundle syohex/emacs-reverse-theme :name reverse-theme
  (add-to-list 'custom-theme-load-path default-directory))

;; undo
(el-get-bundle undo-tree :type git :url "http://www.dr-qubit.org/git/undo-tree.git")
(el-get-bundle m2ym/undohist-el :name undohist)

;; newline
(el-get-bundle smart-newline)

;; search
(el-get-bundle syohex/emacs-anzu :name anzu)

;; cursor
;; (el-get-bundle winterTTr/ace-jump-mode)

;; paren
(el-get-bundle rainbow-delimiters)
(el-get-bundle capitaomorte/autopair)

;; region
(el-get-bundle expand-region)

;; buffer utils
(el-get-bundle m2ym/popwin-el :name popwin)
;; (el-get-bundle lukhas/buffer-move)
(el-get-bundle kentaro/auto-save-buffers-enhanced)
(el-get-bundle recentf-ext)

;; dired
;; (el-get-bundle m2ym/direx-el :name direx)
;; (el-get-bundle syohex/emacs-dired-k :name dired-k)
;; (el-get-bundle dired-hacks)

;; auto-complete
(el-get-bundle auto-complete/popup-el :name popup)
(el-get-bundle auto-complete/fuzzy-el :name fuzzy)
(el-get-bundle auto-complete/auto-complete)

;; helm
(el-get-bundle helm)

;; flycheck
(el-get-bundle flycheck)

;; git
(el-get-bundle magit)
(el-get-bundle syohex/emacs-git-gutter :name git-gutter)

;; major mode
;; ruby
(el-get-bundle ruby-block)
(el-get-bundle ruby-end)
(el-get-bundle inf-ruby)

;; yaml
(el-get-bundle yaml-mode)

;; javascript
(el-get-bundle js2-mode)
(el-get-bundle coffee-mode)

;; markdown
(el-get-bundle markdown-mode)

;; dockerfile
(el-get-bundle dockerfile-mode)

;; groovy(for gradle)
(el-get-bundle groovy-emacs-mode)

;; lua
(el-get-bundle lua-mode)

;; csharp
(el-get-bundle josteink/csharp-mode)
(el-get-bundle OmniSharp/omnisharp-emacs)

;; shell
(el-get-bundle syohex/emacs-quickrun :name quickrun)

;; document
(el-get-bundle dash-at-point)

;; auto-complete plugins
(el-get-bundle zk-phi/ac-c-headers)
(el-get-bundle dgutov/robe)

;; helm plugins
(el-get-bundle helm-descbinds)
(el-get-bundle helm-swoop)
(el-get-bundle helm-ls-git)
(el-get-bundle helm-git-grep)

(defvar package-list
  '(
    ;; auto complete
    auto-complete fuzzy popup

    ;; edit utilities
    ace-jump-mode
    auto-save-buffers-enhanced
    expand-region multiple-cursors smartrep

    open-junk-file

    flycheck flycheck-tip

    ;; buffer utils
    popwin

    ;; direx
    direx

    ;; undo
    undo-tree

    fringe-helper

    helm
    key-chord

    ;; git
    magit git-gutter-fringe+

    ;; ruby
    rspec-mode ruby-block ruby-end

    ;; yaml
    yaml-mode

    ;; markdown
    markdown-mode

    ;; env
    exec-path-from-shell

    ;; theme
    reverse-theme
    viewer
    )
  "A list of packages to install at launch by package.el")

;; install package-list
(dolist (package package-list)
  (when (or (not (package-installed-p package)))
    (package-install package)))

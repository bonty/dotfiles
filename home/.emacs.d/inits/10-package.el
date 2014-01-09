(defvar package-list
  '(
    ;; auto complete
    auto-complete fuzzy popup

    ;; edit utilities
    ace-jump-mode
    auto-save-buffers-enhanced 
    open-junk-file expand-region multiple-cursors smartrep

    ;; undo
    point-undo undo-tree undohist

    fringe-helper

    helm
    key-chord

    ;; git
    magit git-gutter-fringe

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

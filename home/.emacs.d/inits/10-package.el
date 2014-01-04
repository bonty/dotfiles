(defvar package-list
  '(
    auto-complete
    auto-save-buffers-enhanced
    exec-path-from-shell
    fringe-helper
    git-gutter-fringe
    key-chord
    magit
    point-undo
    undo-tree
    viewer
    )
  "A list of packages to install at launch by package.el")

;; install package-list
(dolist (package package-list)
  (when (or (not (package-installed-p package)))
    (package-install package)))

(el-get-lock-unlock 'reverse-theme)
(el-get-bundle! reverse-theme
  (with-eval-after-load-feature 'reverse-theme
    (load-theme 'reverse t)))

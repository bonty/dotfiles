(defvar my/autopair-enabled-modes
  '(c-mode
    c++-mode
    java-mode
    groovy-mode
    python-mode
    sh-mode
    js2-mode
    cmake-mode
    coffee-mode
    lua-mode))

(dolist (mode my/autopair-enabled-modes)
  (add-hook (intern (format "%s-hook" mode)) 'autopair-mode))

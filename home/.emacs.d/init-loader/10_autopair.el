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

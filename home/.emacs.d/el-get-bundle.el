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

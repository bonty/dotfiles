(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
             (concat user-emacs-directory "ac-dict"))
(global-auto-complete-mode t)
(ac-config-default)

(setq ac-use-menu-map t)
(setq ac-use-fuzzy t)

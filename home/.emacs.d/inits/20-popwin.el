(setq pop-up-windows nil)
(require 'popwin)
(setq popwin:close-popup-window-timer-interval 0.5)

(setq display-buffer-function 'popwin:display-buffer)
(push '("*Completions*" :height 0.4) popwin:special-display-config)
(push '("*compilation*" :height 0.4 :noselect t :stick t) popwin:special-display-config)
(push '("*Help*" :height 0.5 :noselect t :stick t) popwin:special-display-config)

;; helm
(push '("helm" :regexp t :height 0.5) popwin:special-display-config)

;; auto-async-byte-compile
(push '(" *auto-async-byte-compile*" :height 14 :noselect t) popwin:special-display-config)

;; direx
(push '(direx:direx-mode :position left :width 0.3 :dedicated t)
      popwin:special-display-config)

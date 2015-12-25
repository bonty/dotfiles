;; general
(scroll-bar-mode -1)
(set-frame-parameter nil 'alpha 85)

;; Mac modifier key setting
(setq-default ns-command-modifier 'meta
              ns-alternate-modifier 'super
              ns-right-command-modifier 'hyper
              ns-use-native-fullscreen nil ;; don't use system fullscreen
              system-uses-terminfo nil)

;; font
(set-face-attribute 'default nil
                    :family "Ricty"
                    :height 130)
(set-fontset-font
 (frame-parameter nil 'font)
 'japanese-jisx0208
 '("Ricty" . "iso10646-1"))
(set-fontset-font
 (frame-parameter nil 'font)
 'japanese-jisx0212
 '("Ricty" . "iso10646-1"))
(set-fontset-font
 (frame-parameter nil 'font)
 'mule-unicode-0100-24ff
 '("Ricty" . "iso10646-1"))
;; for hankaku kana
(set-fontset-font
 (frame-parameter nil 'font)
 'katakana-jisx0201
 '("Ricty" . "iso10646-1"))
;; emoji
(set-fontset-font
 t 'symbol
 (font-spec :family "Apple Color Emoji") nil 'prepend)

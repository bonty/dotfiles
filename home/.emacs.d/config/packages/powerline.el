;; -*- mode: emacs-lisp ; coding: utf-8 -*-

;; (el-get 'sync '(powerline))

;; (require 'powerline)

;; (defpowerline coding-system "%Z")
;; (defpowerline row-and-column "%l:%c")
;; (setq-default mode-line-format
;;               (list "%e"
;;                     '(:eval (concat
;;                              (powerline-rmw            'left   nil  )
;;                              (powerline-coding-system  'left   nil  )
;;                              (powerline-buffer-id      'left   nil  powerline-color1  )
;;                              (powerline-major-mode     'left        powerline-color1  )
;;                              (powerline-minor-modes    'left        powerline-color1  )
;;                              (powerline-narrow         'left        powerline-color1  powerline-color2  )
;;                              (powerline-vc             'center                        powerline-color2  )
;;                              (powerline-make-fill                                     powerline-color2  )
;;                              (powerline-row-and-column 'right       powerline-color1  powerline-color2  )
;;                              (powerline-percent        'right  nil  powerline-color1  )
;;                              (powerline-make-text      "  "    nil  )
;;                              ))))

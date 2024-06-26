(eval-when-compile
  (require 'use-package))

;; (use-package eterm-256color
;;   :straight t
;;   :config
;;   (custom-set-faces
;;    '(eterm-256color-black ((t :inherit default))))
;;   )

(use-package vterm
  :straight t
  :demand
  ;; :hook
  ;; (vterm-mode . (lambda ()
  ;;   (set (make-local-variable 'buffer-face-mode-face) '(:family "0xProto Nerd Font Mono"))
  ;;   (buffer-face-mode t)))
  
  ;; :hook
  ;; (vterm-mode . (lambda () (face-remap-add-relative 'default
  ;;                          :background "#000000")))

  :config
  (setq
   ;; vterm-term-environment-variable "eterm-color"
        vterm-buffer-name-string "%s"
        vterm-max-scrollback 100000
        vterm-kill-buffer-on-exit t)
  ;; (custom-set-faces
  ;;  '(vterm-color-black ((t (:background "gray72" :foreground "black")))))
  :bind
  (("C-c v n" . vterm-other-window)
   ("C-c v v" . vterm))
  )

(provide 'vterm-config)

(eval-when-compile
  (require 'use-package))

(use-package vterm
  :straight t
  :demand
  :config
  (setq vterm-buffer-name-string "%s"
        vterm-max-scrollback 100000
        vterm-kill-buffer-on-exit t)
  (custom-set-faces
   '(vterm-color-default ((t (:inherit default :background "black")))))
  :bind
  (("C-c v n" . vterm-other-window)
   ("C-c v v" . vterm))
  )

(provide 'vterm-config)

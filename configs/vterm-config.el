(eval-when-compile
  (require 'use-package))

(use-package vterm
  :straight t
  :demand
  :config
  (setq vterm-buffer-name-string "%s"
        vterm-kill-buffer-on-exit t)
  :bind
  (("C-c v n" . vterm-other-window)
   ("C-c v v" . vterm))
  )

(provide 'vterm-config)

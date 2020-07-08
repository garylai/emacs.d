(eval-when-compile
  (require 'use-package))

(use-package vterm
  :straight t
  :demand
  :config
  (setq vterm-buffer-name-string "%s")
  :bind
  (("C-c v n" . vterm-other-window))
  )

(provide 'vterm-config)

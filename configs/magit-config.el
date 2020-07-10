(eval-when-compile
  (require 'use-package))

(use-package magit
  :straight t
  :init
  (unbind-key "C-c M-g" magit-file-dispatch)
  (unbind-key "C-x M-g" magit-dispatch)
  :bind
  ("C-x g" . magit-status)
  ("C-c g" . magit-dispatch)
  ("C-c f g" . magit-file-dispatch)
  )

(provide 'magit-config)

(eval-when-compile
  (require 'use-package))

(use-package magit
  :straight t
  :bind
  ("C-x g" . magit-status)
  ("C-c g" . magit-dispatch)
  ("C-c f g" . magit-file-dispatch)
  )

(provide 'magit-config)

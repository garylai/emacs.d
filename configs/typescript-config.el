;;; need typescript-language-server

(eval-when-compile
  (require 'use-package))

(use-package typescript-mode
  :straight t
  :init
  (setq typescript-indent-level 2)
  :mode
  ("\\.tsx?$" . typescript-mode)
  )

(provide 'typescript-config)

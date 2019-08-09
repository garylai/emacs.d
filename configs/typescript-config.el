;;; need typescript-language-server

(eval-when-compile
  (require 'use-package))

(use-package typescript-mode
  :straight t
  :hook
  (typescript-mode . show-paren-mode)
  (typescript-mode . hs-minor-mode)
  (typescript-mode . hl-line-mode)
  :init
  (setq typescript-indent-level 2)
  :mode
  ("\\.ts$" . typescript-mode)
  )

(provide 'typescript-config)

;;; need typescript-language-server

(eval-when-compile
  (require 'use-package))

(use-package typescript-mode
  :straight t
  :hook
  (typescript-mode . show-paren-mode)
  (typescript-mode . hs-minor-mode)
  (typescript-mode . hl-line-mode)
  (typescript-mode . display-line-numbers-mode)
  :init
  (setq typescript-indent-level my/js-indent-level)
  :mode
  ("\\.ts$" . typescript-mode)
  )

(provide 'typescript-config)

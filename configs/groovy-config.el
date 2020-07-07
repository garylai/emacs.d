(eval-when-compile
  (require 'use-package))

(use-package groovy-mode
  :straight t
  :hook
  (groovy-mode . show-paren-mode)
  (groovy-mode . hs-minor-mode)
  (groovy-mode . hl-line-mode)
  (groovy-mode . display-line-numbers-mode)
  :mode ("\\[j|J]enkinsfile$" . groovy-mode)
  )

(provide 'groovy-config)

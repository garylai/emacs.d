(eval-when-compile
  (require 'use-package))

(use-package php-mode
  :straight t
  :hook
  (php-mode . show-paren-mode)
  (php-mode . hs-minor-mode)
  (php-mode . hl-line-mode)
  (php-mode . display-line-numbers-mode)
  (before-save . lsp-eslint-fix-all)
  )

(provide 'php-config)

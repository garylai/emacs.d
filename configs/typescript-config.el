;;; need typescript-language-server

(eval-when-compile
  (require 'use-package))

(use-package typescript-ts-mode
  :straight (:type built-in)
  :mode ("\\.tsx?$" . typescript-ts-mode)
  :hook ((typescript-ts-mode . show-paren-mode)
         (typescript-ts-mode . hs-minor-mode)
         (typescript-ts-mode . hl-line-mode)
         (typescript-ts-mode . display-line-numbers-mode))
  :init
  (setq typescript-ts-mode-indent-offset my/js-indent-level))

(provide 'typescript-config)

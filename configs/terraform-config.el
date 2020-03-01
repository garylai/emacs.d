(eval-when-compile
  (require 'use-package))

(use-package terraform-mode
  :hook
  (terraform-mode . show-paren-mode)
  (terraform-mode . hs-minor-mode)
  (terraform-mode . hl-line-mode)
  (terraform-mode . display-line-numbers-mode)
  :straight t)

(use-package company-terraform
  :straight t
  :config
  (company-terraform-init))

(provide 'terraform-config)

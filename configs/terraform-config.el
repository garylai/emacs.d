(eval-when-compile
  (require 'use-package))

(use-package terraform-mode
  :straight t)

(use-package company-terraform
  :straight t
  :config
  (company-terraform-init))

(provide 'terraform-config)

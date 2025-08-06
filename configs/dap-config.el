(eval-when-compile
  (require 'use-package))

(use-package dap-mode
  :straight t
  :config
  (require 'dap-node)
  (require 'dap-php)
  (dap-node-setup)
  (dap-php-setup))

(provide 'dap-config)

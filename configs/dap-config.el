(eval-when-compile
  (require 'use-package))

(use-package dap-mode
  :straight t
  :config
  (require 'dap-node)
  (dap-node-setup))

(provide 'dap-config)

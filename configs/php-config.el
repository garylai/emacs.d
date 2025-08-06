(eval-when-compile
  (require 'use-package))

(use-package php-mode
  :straight t
  :hook
  (php-mode . show-paren-mode)
  (php-mode . hs-minor-mode)
  (php-mode . hl-line-mode)
  (php-mode . display-line-numbers-mode)
  (php-mode . my/php-mode-disable-lsp-diagnostics)
  (before-save . lsp-eslint-fix-all)
  )

(defun my/php-mode-disable-lsp-diagnostics ()
  "Disable LSP diagnostics only in PHP mode."
  (setq-local lsp-diagnostics-provider :none))

(provide 'php-config)

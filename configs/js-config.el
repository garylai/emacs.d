;;; depends on eslint(JS): npm install -g eslint
;;; depends on tern(JS): npm install -g tern
(eval-when-compile
  (require 'use-package))

(use-package web-mode
  :straight t
  :mode (("\\.js$" . web-mode)
	 ("\\.jsx$" . web-mode))
  :hook
  (web-mode . show-paren-mode)
  :init
  (setq 
     web-mode-code-indent-offset 2
     web-mode-css-indent-offset 2
     web-mode-markup-indent-offset 2
     web-mode-enable-auto-quoting nil)
  )

(use-package json-mode
  :straight t
  :mode ("\\.json$" . json-mode))

(use-package tern
  :straight t
  :hook (web-mode . tern-mode)
  )

(use-package company-tern
    :straight t
    :after company
    :init
    (add-to-list 'company-backends 'company-tern)
)

(use-package flycheck-flow
  :straight t
  :after flycheck
  :config
  (flycheck-add-mode 'javascript-flow 'web-mode)
  )

(provide 'js-config)

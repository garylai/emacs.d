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

(provide 'js-config)

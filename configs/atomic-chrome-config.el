(eval-when-compile
  (require 'use-package))

(use-package atomic-chrome
  :straight t
  :config
  (setq atomic-chrome-url-major-mode-alist
      '(("atlassian" . html-mode)))
  )

(provide 'atomic-chrome-config)

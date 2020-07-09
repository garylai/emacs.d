(eval-when-compile
  (require 'use-package))

(add-hook 'emacs-lisp-mode-hook #'show-paren-mode)

(use-package paredit
  :straight t
  ;; :hook
  ;; ((emacs-lisp-mode lisp-interaction-mode) . paredit-mode)
  )

(use-package rainbow-delimiters
  :straight t
  :hook
  ((emacs-lisp-mode lisp-interaction-mode) . rainbow-delimiters-mode)
  )

(provide 'elisp-config)

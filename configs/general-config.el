(eval-when-compile
  (require 'use-package))

(use-package ido
  :straight t
  :config
  (ido-mode 1)
  (setq ido-decorations
	(quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
  )

;; Clipboard
(use-package xclip
  :straight t
  :config
  (xclip-mode 1))

;; Theme
(use-package darktooth-theme
  :straight t
  :config
  (load-theme 'darktooth t))

;; Auto-Complete
(use-package company
  :straight t
  :hook
  ((web-mode emacs-lisp-mode lisp-interaction) . company-mode)
  :config
  (setq company-tooltip-align-annotations t)
  :bind (
	 :map company-mode-map
	 ([tab] . company-indent-or-complete-common)
	 )
  )

(provide 'general-config)

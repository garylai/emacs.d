(eval-when-compile
  (require 'use-package))

;; don't grep in these
(eval-after-load 'grep
  '(progn
     (add-to-list 'grep-find-ignored-directories "tmp")
     (add-to-list 'grep-find-ignored-directories "node_modules")
     (add-to-list 'grep-find-ignored-directories ".bundle")
     (add-to-list 'grep-find-ignored-directories "auto")
     (add-to-list 'grep-find-ignored-directories "elpa")))

;; don't insert tabs
(setq-default indent-tabs-mode nil)

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
	 ([?\t] . company-indent-or-complete-common)
	 )
  )

;; highlight indentation
(use-package Highlight-Indentation-for-Emacs
	      :straight (Highlight-Indentation-for-Emacs
			 :type git
			 :host github
			 :repo "antonj/Highlight-Indentation-for-Emacs")
	      :hook (
		     ((web-mode yaml-mode) . highlight-indentation-current-column-mode)
		     ((web-mode yaml-mode) . highlight-indentation-mode)
		     )
	      )
;; flycheck
(use-package flycheck
  :straight t
  :config
  (setq flycheck-eslintrc "0")
  (setq-default flycheck-disabled-checkers
  		(append flycheck-disabled-checkers
  			'(javascript-jshint)))
  (flycheck-add-mode 'javascript-eslint 'web-mode)
  :hook ((sh-mode web-mode yaml-mode) . flycheck-mode)
  )

(provide 'general-config)

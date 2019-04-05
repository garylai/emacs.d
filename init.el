(setq package-enable-at-startup nil)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

 ;; shift arrow to move between windows
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(straight-use-package 'use-package)
(straight-use-package 'dash)
(straight-use-package 'dash-functional)
(straight-use-package 'epl)

(use-package ido
  :straight t
  :config
  (ido-mode 1)
  (setq ido-decorations
	(quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
  )

(use-package xclip
  :straight t
  :config
  (xclip-mode 1))

(use-package darktooth-theme
  :straight t
  :config
  (load-theme 'darktooth t))

(use-package projectile
  :straight t
  :config
  (projectile-global-mode)
  (setq projectile-switch-project-action 'neotree-projectile-action)
  :bind (:map projectile-mode-map
	 ("C-c p" . projectile-command-map)))

(use-package neotree
  :straight t
  :bind ([f8] . neotree-toggle)
  :config (setq neo-autorefresh nil))

;; JS
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

;; company
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

;; elisp
(add-hook 'emacs-lisp-mode-hook #'show-paren-mode)

(use-package paredit
  :straight t
  :hook
  ((emacs-lisp-mode lisp-interaction-mode) . paredit-mode)
  )

(use-package rainbow-delimiters
  :straight t
  :hook
  ((emacs-lisp-mode lisp-interaction-mode) . rainbow-delimiters-mode)
  )

(eval-when-compile
  (require 'use-package))

 ;; shift arrow to move between windows
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(use-package ace-window
  :straight t
  :bind (("M-o" . ace-window))
  )
(use-package projectile
  :straight t
  :init
  (projectile-global-mode)
  (setq projectile-switch-project-action 'neotree-projectile-action)
  (setq projectile-completion-system 'ivy)
  :bind (:map projectile-mode-map
	 ("C-c p" . projectile-command-map)))

(use-package neotree
  :straight t
  :bind ([f8] . neotree-toggle)
  :config
  (setq neo-autorefresh nil))

(provide 'navigation-config)

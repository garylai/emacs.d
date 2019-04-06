(eval-when-compile
  (require 'use-package))

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

(provide 'navigation-config)

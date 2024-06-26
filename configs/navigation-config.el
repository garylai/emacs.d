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
  ;; (setq projectile-switch-project-action 'neotree-projectile-action)
  (setq projectile-completion-system 'ivy)
  :bind (:map projectile-mode-map
	 ("C-c p" . projectile-command-map)))

;; (use-package neotree
;;   :straight t
;;   :bind ([f8] . neotree-toggle)
;;   :config
;;   (setq neo-autorefresh nil)
;;   (setq neo-smart-open t)
;;   )


(use-package treemacs
  :straight t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (require 'ace-window)
    (setq aw-ignored-buffers (delq 'treemacs-mode aw-ignored-buffers)
          treemacs-no-png-images nil
          reemacs-is-never-other-window nil
          treemacs-space-between-root-nodes nil
          treemacs-width 60
          ;; treemacs-no-png-images t
          treemacs-resize-icons 15)
    (treemacs-follow-mode t))
  :bind (("C-x t" . treemacs))
  (:map treemacs-mode-map
        ("M" . treemacs-mark-or-unmark-path-at-point)
        ("C-s" . treemacs-find-file))
  )

(use-package treemacs-projectile
  :straight t
  :after treemacs projectile
  :ensure t)

(provide 'navigation-config)

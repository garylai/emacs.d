(use-package ivy
  :straight t
  :config
  (progn
    (ivy-mode))
  :init
  (setq ivy-re-builders-alist
        '((counsel-M-x . ivy--regex-fuzzy)
          (t . ivy--regex-ignore-order )))
  (setq
   ivy-use-virtual-buffers t
   ivy-count-format "(%d/%d) "))

(use-package swiper
  :straight t
  :bind (
         ("C-s" . swiper))
  )

(use-package counsel
  :straight t
  :bind (
         ("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         :map projectile-command-map
         ("s s" . counsel-ag))
  )



(provide 'ivy-config)

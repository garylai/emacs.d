(use-package ivy
  :straight t
  :config
  (progn
    (ivy-mode))
  :init
  (setq ivy-re-builders-alist
        '((swiper . ivy--regex-plus)
          (counsel-ag . ivy--regex-plus)
          (t . ivy--regex-fuzzy)))
  (setq
   ivy-use-virtual-buffers t
   ivy-count-format "(%d/%d) "))

(use-package flx
  :straight t
  :after ivy)

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

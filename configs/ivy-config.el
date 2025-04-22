(use-package ivy
  :straight t
  :demand
  :config (ivy-mode)
  :bind (("C-c C-r" . ivy-resume))
  :custom
  (ivy-count-format "(%d/%d) ")
  (ivy-use-virtual-buffers t)
  (ivy-re-builders-alist
        '((counsel-M-x . ivy--regex-fuzzy)
          (t . ivy--regex-ignore-order ))))   

(use-package swiper
  :straight t
  :after ivy
  :bind (
         ("C-s" . swiper)
         ("C-r" . swiper))
  )

(use-package counsel
  :straight t
  :after ivy
  :bind (
         ("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         :map projectile-command-map
         ("s s" . counsel-ag))
  :init
  (setq counsel-ag-base-command "ag --nocolor --nogroup --ignore dist_dev --hidden --ignore node_modules %s")
  )



(provide 'ivy-config)

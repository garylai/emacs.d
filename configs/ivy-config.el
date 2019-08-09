(use-package ivy
  :straight t
  :config
  (progn
    (ivy-mode))
  :bind (
         ("C-s" . swiper)
         ("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file))
  :init
  (setq ivy-re-builders-alist
      '((t . ivy--regex-fuzzy)))
  (setq
   ivy-use-virtual-buffers t
   ivy-count-format "(%d/%d) "))

(use-package flx
  :straight t
  :after ivy)

(use-package swiper
  :straight t)

(use-package counsel
  :straight t)

(provide 'ivy-config)

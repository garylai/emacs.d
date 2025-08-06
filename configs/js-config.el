;;; depends on eslint(JS): npm install -g eslint

(eval-when-compile
  (require 'use-package))

(use-package js-ts-mode
  :straight (:type built-in)
  :mode ("\\.jsx?$" . js-ts-mode)
  :hook ((js-ts-mode . show-paren-mode)
         (js-ts-mode . hs-minor-mode)
         (js-ts-mode . hl-line-mode)
         (js-ts-mode . display-line-numbers-mode))
  :init
  (setq js-ts-mode-indent-offset my/js-indent-level))


(use-package json-mode
  :straight t
  :hook
  (json-mode . show-paren-mode)
  (json-mode . hs-minor-mode)
  (json-mode . hl-line-mode)
  (json-mode . display-line-numbers-mode)
  (json-mode . (lambda ()
            (make-local-variable 'js-indent-level)
            (setq tab-width 2)
            (setq js-indent-level 2)))
  :mode ("\\.json$" . json-mode))

(use-package flycheck-flow
  :straight t
  :after flycheck
  :config
  (flycheck-add-mode 'javascript-flow 'web-js-mode)
  )


(provide 'js-config)


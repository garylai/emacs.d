;;; depends on eslint(JS): npm install -g eslint

(eval-when-compile
  (require 'use-package))

(use-package web-mode
  :straight t
  :hook
  (web-mode . show-paren-mode)
  (web-mode . hs-minor-mode)
  (web-mode . hl-line-mode)
  (web-mode . display-line-numbers-mode)
  :config
  (unbind-key "C-c C-r" web-mode-map)
  (setcdr (assoc "lineup-args" web-mode-indentation-params) nil)
  (setcdr (assoc "lineup-concats" web-mode-indentation-params) nil)
  (setcdr (assoc "lineup-calls" web-mode-indentation-params) nil)
  (setcdr (assoc "lineup-ternary" web-mode-indentation-params) nil)
  :init
  (setq 
     web-mode-code-indent-offset 2
     web-mode-css-indent-offset 2
     web-mode-markup-indent-offset 2
     web-mode-enable-auto-quoting nil)
  )

(use-package web-submodes
  :mode ("\\.jsx?$" . web-js-mode)
  )

(use-package web-submodes
  :mode ("\\.tsx$" . web-ts-mode)
  )

(use-package json-mode
  :straight t
  :hook
  (json-mode . show-paren-mode)
  (json-mode . hs-minor-mode)
  (json-mode . hl-line-mode)
  (json-mode . display-line-numbers-mode)
  :mode ("\\.json$" . json-mode))

(use-package flycheck-flow
  :straight t
  :after flycheck
  :config
  (flycheck-add-mode 'javascript-flow 'web-js-mode)
  )


(provide 'js-config)
1

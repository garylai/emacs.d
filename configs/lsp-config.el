(eval-when-compile
  (require 'use-package))

(use-package lsp-mode
  :straight t
  :bind (:map lsp-mode-map
              ("M-n" . lsp-rename)
              ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
              ([remap xref-find-references] . lsp-ui-peek-find-references))

  :config
  (setq lsp-eldoc-render-all nil
        lsp-eldoc-enable-hover nil
        lsp-eldoc-enable-signature-help nil
        lsp-eldoc-prefer-signature-help nil
        lsp-inhibit-message t
        lsp-prefer-flymake :none
        lsp-highlight-symbol-at-point nil)      
  
  (use-package lsp-ui
    :straight t
    :config
    (setq
     lsp-ui-imenu-enable t
     lsp-ui-sideline-enable t
     lsp-ui-sideline-show-code-actions nil
     lsp-ui-sideline-show-flycheck nil
     lsp-ui-doc-enable nil
     lsp-ui-peek-fontify (quote always)
     lsp-ui-peek-enable t)
    
    (custom-set-faces
     '(lsp-ui-peek-peek ((t (:background "#181818"))))
     '(lsp-face-highlight-read ((t (:inherit highlight))))
     '(lsp-ui-sideline-global ((t (:background "green"))))
     '(lsp-ui-sideline-current-symbol ((t (:foreground "black" :box (:line-width -1 :color "black") :weight ultra-bold :height 0.99))))
     '(lsp-ui-sideline-global ((t (:background "green"))))
     '(lsp-ui-sideline-symbol ((t (:foreground "black" :box (:line-width -1 :color "black") :height 0.99)))))
    :commands lsp-ui-mode)

  (use-package company-lsp
    :straight t
    :commands company-lsp
    :config
    (push 'company-lsp company-backends))
  
  :hook
  (web-js-mode . lsp)
  (web-ts-mode . lsp))


(use-package lsp-patch
  :after (lsp-mode))

(provide 'lsp-config)

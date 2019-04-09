(eval-when-compile
  (require 'use-package))

(use-package lsp-mode
  :straight t
  :config
  (setq lsp-eldoc-render-all nil
        lsp-eldoc-enable-hover nil
        lsp-eldoc-enable-signature-help nil
        lsp-eldoc-prefer-signature-help nil
        lsp-inhibit-message t
        lsp-prefer-flymake :none
        lsp-highlight-symbol-at-point nil)
  (define-key lsp-mode-map [remap xref-find-definitions] #'lsp-find-definition)
  (define-key lsp-mode-map [remap xref-find-references] #'lsp-find-references)
  
  (use-package lsp-ui
    :straight t
    :config
    (setq
     lsp-ui-imenu-enable t
     lsp-ui-sideline-enable t
     lsp-ui-sideline-show-code-actions nil
     lsp-ui-sideline-show-flycheck nil
     lsp-ui-doc-enable nil
     lsp-ui-peek-enable nil)
    (custom-set-faces
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
  (web-mode . lsp))


(provide 'lsp-config)

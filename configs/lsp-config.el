(eval-when-compile
  (require 'use-package))

(use-package lsp-mode
  :straight t
  :config
  (setq lsp-eldoc-render-all nil
        lsp-inhibit-message t
        lsp-prefer-flymake :none
        lsp-highlight-symbol-at-point nil)
  (define-key lsp-mode-map [remap xref-find-definitions] #'lsp-find-definition)
  (define-key lsp-mode-map [remap xref-find-references] #'lsp-find-references)
  
  (use-package lsp-ui
    :straight t
    :config
    (setq lsp-ui-imenu-enable t)
    (setq
     lsp-ui-imenu-enable t
     lsp-ui-sideline-enable t
     lsp-ui-sideline-show-code-actions nil
     lsp-ui-sideline-show-flycheck nil
     lsp-ui-doc-enable nil
     lsp-ui-peek-enable nil)
    
    :commands lsp-ui-mode)

  (use-package company-lsp
    :straight t
    :commands company-lsp
    :config
    (push 'company-lsp company-backends))

  :hook
  (web-mode . lsp))

(provide 'lsp-config)

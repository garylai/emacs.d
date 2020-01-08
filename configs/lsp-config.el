;; npm install -g typescript-language-server typescript
;; install eslint plugin https://github.com/emacs-lsp/lsp-mode/wiki/LSP-ESlint-integration, then ln to ~/.emacs.d/eslint-plugin
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
        lsp-eldoc-enable-signature-help t
        lsp-eldoc-prefer-signature-help t
        lsp-inhibit-message t
        lsp-prefer-flymake :none
        lsp-highlight-symbol-at-point nil)
  (setq lsp-eslint-server-command
   '("node"
     "/Users/garylai/.emacs.d/eslint-plugin/extension/server/out/eslintServer.js" 
     "--stdio"))
  (add-to-list 'lsp-language-id-configuration '(web-js-mode . "javascript"))
  (add-to-list 'lsp-language-id-configuration '(web-ts-mode . "typescript"))
  (add-to-list 'lsp-language-id-configuration '(typescript-mode . "typescript"))

  (use-package yasnippet
    :straight t)

  (use-package lsp-ui
    :straight t
    :config
    (setq     
     lsp-ui-imenu-enable nil
     lsp-ui-sideline-enable t
     lsp-ui-sideline-show-code-actions nil
     lsp-ui-flycheck t
     lsp-ui-flycheck-enable t
     lsp-ui-flycheck-live-reporting t
     lsp-ui-sideline-delay 1.5
     lsp-ui-sideline-show-hover t
     lsp-ui-doc-enable nil
     lsp-ui-peek-fontify (quote always)
     lsp-ui-peek-enable t)
    
    (custom-set-faces
     '(lsp-ui-peek-peek ((t (:background "#181818"))))
     '(lsp-face-highlight-read ((t (:inherit highlight))))
     ;; '(lsp-ui-sideline-global ((t (:background "green"))))
     '(lsp-ui-sideline-symbol-info ((t (:foreground "brightblue" :slant italic :height 0.99))))
     '(lsp-ui-sideline-current-symbol ((t (:foreground "brightcyan" :box (:line-width -1 :color "black") :weight ultra-bold :height 0.99))))
     '(lsp-ui-sideline-symbol ((t (:foreground "color-242" :box (:line-width -1 :color "black") :height 0.99)))))
    :commands lsp-ui-mode)

  (use-package company-lsp
    :straight t
    :commands company-lsp
    :config
    (push 'company-lsp company-backends))
  
  :hook
  (typescript-mode . lsp)
  (web-js-mode . lsp)
  (web-ts-mode . lsp))

(provide 'lsp-config)

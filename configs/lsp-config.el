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
  :hook
  (typescript-mode . lsp)
  (web-js-mode . lsp)
  (web-ts-mode . lsp)
  :custom
  ((lsp-log-io nil)
   (lsp-print-performance nil)

   (lsp-enable-snippet nil)

   (lsp-enable-indentation nil)
   (lsp-enable-file-watchers nil)
   (lsp-headerline-breadcrumb-enable nil)

   (lsp-eldoc-render-all nil)
   (lsp-eldoc-enable-hover nil)
   (lsp-eldoc-enable-signature-help t)
   (lsp-eldoc-prefer-signature-help t)

   
   (lsp-inhibit-message t)

   (lsp-modeline-code-actions-enable nil)

   (lsp-signature-auto-activate nil)

   ;; this doesn't work ATM (doing it in before-save-hook)
   (lsp-eslint-auto-fix-on-save t)
   (lsp-prefer-flymake :none)
   (lsp-enable-symbol-highlighting t))

  :preface
  (progn
    (defun turing-it-off-and-on-again ()
      (when lsp-enable-symbol-highlighting
        (lsp-toggle-symbol-highlight))
      (lsp-toggle-symbol-highlight))
    (defun restart-highlight ()
      (run-at-time "2 sec" nil 'turing-it-off-and-on-again)))
  :config
  ;; when eslint and typescript server are both enabled, lsp doesn't think the current workspace have highlight feature somehow when it starts...
  (progn
    (add-hook 'lsp-mode-hook #'restart-highlight))
  (setq lsp-eslint-server-command
        '("node"
          "/Users/garylai/.emacs.d/eslint-plugin/extension/server/out/eslintServer.js" 
          "--stdio"))
  (add-to-list 'lsp-language-id-configuration '(web-js-mode . "javascript"))
  (add-to-list 'lsp-language-id-configuration '(web-ts-mode . "typescript"))
  (add-to-list 'lsp-language-id-configuration '(typescript-mode . "typescript"))
  :commands lsp)

;; (use-package yasnippet
;;   :straight t)

(use-package lsp-ui
  :straight t
  :custom
  ((lsp-ui-doc-enable nil)
   (lsp-ui-imenu-enable nil)
   (lsp-ui-sideline-enable t)
   (lsp-ui-sideline-show-code-actions nil)
   (lsp-ui-doc-show-with-cursor t)
   (lsp-ui-doc-border (face-foreground 'default))
   ;; (lsp-ui-flycheck nil)
   (lsp-ui-flycheck-enable t)
   (lsp-ui-sideline-show-diagnostics t)
   ;; (lsp-ui-flycheck-live-reporting nil)
   (lsp-ui-sideline-delay 2)
   (lsp-ui-doc-delay 2)
   (lsp-ui-doc-position 'at-point)
   (lsp-ui-sideline-show-hover t)
   (lsp-ui-peek-fontify (quote always))
   (lsp-ui-peek-enable nil))
  :hook (
         ((org-mode) . (lambda ()
                                                        (setq lsp-ui-sideline-show-code-actions t)
                                                        ))
         (org-mode . lsp-ui-doc-mode)
         )

  :config
  (if (memq window-system '(mac ns x))
      ;; GUI
      (custom-set-faces
       '(lsp-ui-peek-peek ((t (:background "#181818"))))
       '(lsp-face-highlight-read ((t (:inherit highlight))))
       ;; '(lsp-ui-sideline-global ((t (:background "green"))))
       '(lsp-ui-sideline-symbol-info ((t (:foreground "light blue" :slant italic :height 0.99))))
       '(lsp-ui-sideline-current-symbol ((t (:foreground "light cyan" :box nil :weight ultra-bold :height 0.99))))
       '(lsp-ui-sideline-symbol ((t (:foreground "dim gray" :box nil :height 0.99)))))
    ;; terminal
    (custom-set-faces
     '(lsp-ui-peek-peek ((t (:background "#181818"))))
     '(lsp-face-highlight-read ((t (:inherit highlight))))
     ;; '(lsp-ui-sideline-global ((t (:background "green"))))
     '(lsp-ui-sideline-symbol-info ((t (:foreground "brightblue" :slant italic :height 0.99))))
     '(lsp-ui-sideline-current-symbol ((t (:foreground "brightcyan" :box (:line-width -1 :color "black") :weight ultra-bold :height 0.99))))
     '(lsp-ui-sideline-symbol ((t (:foreground "color-242" :box (:line-width -1 :color "black") :height 0.99)))))
    )
  :commands lsp-ui-mode)

;; (use-package company-lsp
;;   :straight t
;;   :commands company-lsp
;;   :config
;;   (push 'company-lsp company-backends))

;; npm install -g @emacs-grammarly/keytar-cli


(use-package keytar
  :straight t
  :config
  (keytar-install)
)
(use-package lsp-grammarly
  :straight t
  :hook ((text-mode org-mode) . (lambda ()
                       (require 'lsp-grammarly)
                       (lsp)))
  )

(provide 'lsp-config)

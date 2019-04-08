;;; depends on eslint(JS): npm install -g eslint
;;; depends on tern(JS): npm install -g tern
;;; depends on ~/.tern_config
(eval-when-compile
  (require 'use-package))

(use-package web-mode
  :straight t
  :mode (("\\.js$" . web-mode)
	 ("\\.jsx$" . web-mode))
  :hook
  (web-mode . show-paren-mode)
  :config
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

(use-package json-mode
  :straight t
  :mode ("\\.json$" . json-mode))

(use-package lsp-mode
  :straight t
  :config
  (setq lsp-eldoc-render-all nil
        lsp-inhibit-message t
        lsp-prefer-flymake :none
        lsp-highlight-symbol-at-point nil)
  
  (use-package lsp-ui
    :straight t
    :config
    (setq lsp-ui-sideline-enable t
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


(use-package flycheck-flow
  :straight t
  :after flycheck
  :config
  (flycheck-add-mode 'javascript-flow 'web-mode)
  )


;; make lsp to start ts server when using web-mode
(require 'el-patch)

(el-patch-feature lsp-mode)

(with-eval-after-load 'lsp-clients
  (with-no-warnings
    (el-patch-defun lsp-typescript-javascript-tsx-jsx-activate-p (filename mode)
                    "Check if the javascript-typescript language server should be enabled
based on FILE-NAME and MAJOR-MODE"
                    (or (member mode '(typescript-mode typescript-tsx-mode js-mode web-mode js2-mode rjsx-mode))
                        (and (eq major-mode 'web-mode)
                             (or (string-suffix-p ".tsx" filename t)
                                 (string-suffix-p ".jsx" filename t)))))))

(provide 'js-config)

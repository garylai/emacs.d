;;; depends on eslint(JS): npm install -g eslint

(eval-when-compile
  (require 'use-package))

(use-package web-mode
  :straight t
  :mode (("\\.js$" . web-mode)
	 ("\\.jsx$" . web-mode)
         ("\\.ts$" . web-mode))
  :hook
  (web-mode . show-paren-mode)
  (web-mode . hs-minor-mode)
  (web-mode . linum-mode)
  (web-mode . hl-line-mode)
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

(use-package flycheck-flow
  :straight t
  :after flycheck
  :config
  (flycheck-add-mode 'javascript-flow 'web-mode)
  )


;; make lsp to start ts server when using web-mode
;; to-do: https://github.com/emacs-lsp/lsp-mode#adding-support-for-languages
;; set up lsp-language-id-configuration
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

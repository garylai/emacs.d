;; make lsp to start ts server when using web-mode
;; to-do: https://github.com/emacs-lsp/lsp-mode#adding-support-for-languages
;; set up lsp-language-id-configuration
(eval-when-compile
  (require 'el-patch))

(el-patch-feature lsp-mode)

(with-eval-after-load 'lsp-clients
  (with-no-warnings
    (el-patch-defun lsp-typescript-javascript-tsx-jsx-activate-p (filename mode)
                    "Check if the javascript-typescript language server should be enabled
based on FILE-NAME and MAJOR-MODE"
                    (or (member mode '(typescript-mode typescript-tsx-mode js-mode web-mode web-js-mode web-ts-mode js2-mode rjsx-mode))
                        (and (eq major-mode 'web-mode)
                             (or (string-suffix-p ".tsx" filename t)
                                 (string-suffix-p ".jsx" filename t)))))))
(provide 'lsp-patch)

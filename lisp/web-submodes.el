(eval-when-compile
  (require 'web-mode))

(define-derived-mode web-js-mode web-mode "web-js-mode"
  "js mode derived from web-mode."
  (setq-local web-mode-enable-auto-indentation nil))

(define-derived-mode web-ts-mode web-mode "web-ts-mode"
  "ts mode derived from web-mode."
  (setq-local web-mode-enable-auto-indentation nil))

(provide 'web-submodes)

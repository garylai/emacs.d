;;; depends on racer(Rust): cargo install racer
(eval-when-compile
  (require 'use-package))

(use-package rust-mode
  :straight t)

(use-package racer
  :straight t
  :hook (rust-mode . racer-mode)
  )

(provide 'rust-config)

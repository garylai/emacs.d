(eval-when-compile
  (require 'use-package))

;; install dotnet by installer https://dotnet.microsoft.com/en-us/download/dotnet
;; *** install Omnisharp-Roslyn language server by lsp-install-server
;; use csharp-ls instead; Omnisharp-Roslyn doesn't support go to meta data and they don't care
(use-package csharp-mode
  :straight t
  :hook
  (csharp-mode . show-paren-mode)
  (csharp-mode . hs-minor-mode)
  (csharp-mode . hl-line-mode)
  (csharp-mode . display-line-numbers-mode)
)

(provide 'csharp-config)

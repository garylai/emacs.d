(eval-when-compile
  (require 'use-package))

;; install dotnet by installer https://dotnet.microsoft.com/en-us/download/dotnet
;; install Omnisharp-Roslyn language server by lsp-install-server
(use-package csharp-mode
	      :straight t)

(provide 'csharp-config)

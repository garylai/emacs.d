;; text editing

(add-hook 'text-mode-hook #'flyspell-mode)
(add-hook 'text-mode-hook #'visual-line-mode)

(provide 'text-config)

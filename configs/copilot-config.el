(eval-when-compile
  (require 'use-package))

;; Define the shared prefix keymap
(define-prefix-command 'copilot-prefix-map)

;; Bind the prefix key to the keymap
(global-set-key (kbd "C-c C-p") 'copilot-prefix-map)

(use-package copilot
  :straight (:host github :repo "copilot-emacs/copilot.el" :files ("*.el"))
  :disabled t
  :ensure t
  :bind (
         :map copilot-prefix-map
         ("<return>" . copilot-complete)
         :map copilot-mode-map
         ("C-s-<return>" . copilot-accept-completion)
         ("C-s-<up>" . copilot-next-completion)
         ("C-s-<down>" . copilot-previous-completion)
         ("C-s-<right>" . copilot-accept-completion-by-word)
        )
  :hook
  (typescript-mode . copilot-mode)
  (web-js-mode . copilot-mode)
  (web-ts-mode . copilot-mode)
  (org-mode . copilot-mode)
  (markdown-mode . copilot-mode)
  :config
    (add-to-list 'copilot-disable-predicates #'(lambda () t))
  )


(use-package copilot-chat
  :straight (:host github :repo "chep/copilot-chat.el" :files ("*.el"))
  :ensure t
  :after (request)
  :custom
  (copilot-chat-backend 'request)
  :bind (
         :map copilot-prefix-map
         ("t" . copilot-chat-transient)
         ("a" . copilot-chat-add-current-buffer)
         ("f" . copilot-chat-add-file)
         ("d" . copilot-chat-add-files-under-dir)
        )
  )

(provide 'copilot-config)

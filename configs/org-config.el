
(eval-when-compile
  (require 'use-package))

(use-package org
  :mode (("\\.org$" . org-mode))
  :init
  (setq org-log-done t)
  (setq org-agenda-window-setup (quote current-window))
  (setq org-src-window-setup (quote current-window))
  ;; (add-hook 'org-shiftup-final-hook #'windmove-up)
  ;; (add-hook 'org-shiftleft-final-hook #'windmove-left)
  ;; (add-hook 'org-shiftdown-final-hook #'windmove-down)
  ;; (add-hook 'org-shiftright-final-hook #'windmove-right)
  (setq org-agenda-files (list "~/org"
                               "~/org/1on1"
                               "~/org/work/"
                               "~/workspace/meeting-notes"))
  :bind
  (("C-c a" . org-agenda)
   ;; ("C-c s" . org-search-view)
   ;; ("C-c t"  . org-todo-list)
   ;; ("C-c /" . 'org-tags-view)
   :map org-mode-map
   ;; "<backtab>" #'org-global-cycle
   ;; "<tab>" #'org-cycle
   ;; "C-c C-." #'org-time-stamp-inactive
   ;; "C-c c" #'org-columns
   ("M-n" . org-metadown)
   ("M-p" . org-metaup)
   ;; "RET" #'org-return
   )
  )

(provide 'org-config)

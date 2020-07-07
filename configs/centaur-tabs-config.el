;;; iterm2 perfernce:
;;; Keys -> Key Combination ^, send ^[ [a,
;;; Keys -> Key Combination ^. send ^[ [a.
;;; https://superuser.com/questions/731427/how-do-i-send-ctrl-in-iterm2

(eval-when-compile
  (require 'use-package))

(use-package centaur-tabs
  :straight t
  :demand
  :config
  (centaur-tabs-mode t)
  (centaur-tabs-group-by-projectile-project)
  (setq centaur-tabs-set-bar 'left
        centaur-tabs-cycle-scope 'tabs)
  :bind
  ("C-[ [ a ," . centaur-tabs-backward)
  ("C-[ [ a ." . centaur-tabs-forward)
  ("C-," . centaur-tabs-backward)
  ("C-." . centaur-tabs-forward)
  ("C-c t g" . centaur-tabs-counsel-switch-group)
  )

(provide 'centaur-tabs-config)

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
  ;; (centaur-tabs-group-by-projectile-project)
  (centaur-tabs-group-buffer-groups)
  (setq centaur-tabs-set-bar 'left
        centaur-tabs-cycle-scope 'tabs
        centaur-tabs-set-close-button nil
        centaur-tabs-set-modified-marker t
        )
  (defun centaur-tabs-buffer-groups ()
      "`centaur-tabs-buffer-groups' control buffers' group rules.

    Group centaur-tabs with mode if buffer is derived from `eshell-mode' `emacs-lisp-mode' `dired-mode' `org-mode' `magit-mode'.
    All buffer name start with * will group to \"Emacs\".
    Other buffer group by `centaur-tabs-get-group-name' with project name."
      (require 'centaur-tabs-functions)

      (interactive)
      (list
	(cond
	 ((or (string-equal "*" (substring (buffer-name) 0 1))
	      (memq major-mode '(magit-process-mode
				 magit-status-mode
				 magit-diff-mode
				 magit-log-mode
				 magit-file-mode
				 magit-blob-mode
				 magit-blame-mode
				 )))
	  "Emacs")
         ((derived-mode-p 'vterm-mode)
	  "Shells")
         ((condition-case _err
              (projectile-project-root)
            (error nil)) (projectile-project-name))

	 ((derived-mode-p 'prog-mode)
	  "Editing")
	 ((derived-mode-p 'dired-mode)
	  "Dired")
	 ((memq major-mode '(helpful-mode
			     help-mode))
	  "Help")
	 ((memq major-mode '(org-mode
			     org-agenda-clockreport-mode
			     org-src-mode
			     org-agenda-mode
			     org-beamer-mode
			     org-indent-mode
			     org-bullets-mode
			     org-cdlatex-mode
			     org-agenda-log-mode
			     diary-mode))
	  "OrgMode")
	 (t
	  (centaur-tabs-get-group-name (current-buffer))))))
  :bind
  ("C-[ [ a ," . centaur-tabs-backward)
  ("C-[ [ a ." . centaur-tabs-forward)
  ("C-{" . centaur-tabs-backward)
  ("C-}" . centaur-tabs-forward)
  ("C-c t g" . centaur-tabs-counsel-switch-group)
  ("C-c t k" . centaur-tabs-kill-other-buffers-in-current-group)
  )

(provide 'centaur-tabs-config)

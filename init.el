(setq package-enable-at-startup nil)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(straight-use-package 'dash)
(straight-use-package 'dash-functional)
(straight-use-package 'epl)

(add-to-list 'load-path (concat user-emacs-directory
        (convert-standard-filename "configs")))

(use-package backup-config)
(use-package general-config)
(use-package dockerfile-config)
(use-package navigation-config)
(use-package js-config)
(use-package elisp-config)
(use-package yaml-config)
(use-package rust-config)
(use-package text-config)

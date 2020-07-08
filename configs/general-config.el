(eval-when-compile
  (require 'use-package))

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(set-face-attribute 'default nil :height 150)

(setq linum-format "%4d |")

;; env vars for GUI emacs
(use-package exec-path-from-shell
  :straight t
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize))
  )

;; file changes
(use-package git-gutter
  :straight t
  :config
  (global-git-gutter-mode t)
  (setq git-gutter:modified-sign ">>")
  (setq git-gutter:added-sign "++")
  (setq git-gutter:deleted-sign "--")
  (custom-set-faces
   '(git-gutter:added ((t (:background "color-235" :foreground "#878700"))))
   '(git-gutter:deleted ((t (:background "color-235" :foreground "#870000"))))
   '(git-gutter:modified ((t (:background "color-235" :foreground "#875f87")))))
   )

;; Display buffer full path on title

(defun xterm-title-update ()
    (interactive)
    (send-string-to-terminal (concat "\033]1; " (buffer-name) "\007"))
    (if buffer-file-name
        (let ((relative-path (file-relative-name (buffer-file-name) (projectile-project-root))))
          (send-string-to-terminal (concat "\033]2; " relative-path "\007")))))

(unless (memq window-system '(mac ns x))
  (add-hook 'post-command-hook 'xterm-title-update)
)

;; code fold
(defun toggle-fold ()
  "Toggle fold all lines larger than indentation on current line"
  (interactive)
  (let ((col 1))
    (save-excursion
      (back-to-indentation)
      (setq col (+ 1 (current-column)))
      (set-selective-display
       (if selective-display nil (or col 1))))))

(global-set-key (kbd "C-c f") 'toggle-fold)

;; don't grep in these
(eval-after-load 'grep
  '(progn
     (add-to-list 'grep-find-ignored-directories "tmp")
     (add-to-list 'grep-find-ignored-directories "node_modules")
     (add-to-list 'grep-find-ignored-directories ".bundle")
     (add-to-list 'grep-find-ignored-directories "auto")
     (add-to-list 'grep-find-ignored-directories "dist")
     (add-to-list 'grep-find-ignored-directories "dist_dev")
     (add-to-list 'grep-find-ignored-directories "elpa")))

;; don't insert tabs
(setq-default indent-tabs-mode nil)

(setq-default display-line-numbers-type (quote relative))

(use-package ido
  :straight t
  :config
  (ido-mode 1)
  (setq ido-decorations
	(quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
  )

;; Clipboard
(use-package xclip
  :straight t
  :config
  (xclip-mode 1))

;; Theme
(use-package darktooth-theme
  :straight t
  :config
  (load-theme 'darktooth t))

;; Auto-Complete
(use-package company
  :straight t
  :hook
  ((web-mode typescript-mode emacs-lisp-mode lisp-interaction) . company-mode)
  :config
  (setq company-tooltip-align-annotations t)
  :bind (
	 :map company-mode-map
	 ([?\t] . company-indent-or-complete-common)
	 )
  )

;; highlight indentation
(use-package highlight-indent-guides
  :straight t
  :config
  (setq highlight-indent-guides-method 'character)
  (setq highlight-indent-guides-responsive 'top)
  :hook
  ((web-mode yaml-mode) . highlight-indent-guides-mode)
  )

;; flycheck
(use-package flycheck
  :straight t
  :config
  (setq flycheck-eslintrc "0")
  (setq-default flycheck-disabled-checkers
  		(append flycheck-disabled-checkers
  			'(javascript-jshint)))
  (flycheck-add-mode 'javascript-eslint 'web-js-mode)
  (flycheck-add-mode 'javascript-eslint 'web-ts-mode)
  (flycheck-add-mode 'javascript-eslint 'typescript-mode)
  (custom-set-faces
   '(flycheck-error-list-warning ((t (:foreground "color-220" :weight bold))))
   '(flycheck-fringe-warning ((t (:foreground "color-220")))))
  :hook ((sh-mode web-js-mode web-ts-mode yaml-mode typescript-mode) . flycheck-mode)
  )

;; imenu
(use-package imenu-list
  :straight t
  :config
  (setq imenu-list-focus-after-activation t
        imenu-list-auto-resize t))

;; mode line
(use-package doom-modeline
  :straight t
  :config
  (setq doom-modeline-buffer-encoding nil)
  :hook (after-init . doom-modeline-mode))

;; code folding
(defun add-code-fold-keys ()
  (interactive)
  (local-set-key (kbd "C-c C-e") 'hs-hide-block)
  (local-set-key (kbd "C-c C-o") 'hs-show-block)
  (local-set-key (kbd "C-c C-a C-e") 'hs-hide-level)
  (local-set-key (kbd "C-c C-a C-o") 'hs-show-all))

(add-hook 'hs-minor-mode-hook #'add-code-fold-keys)

;; hightlight current line
(defun set-highlight-background ()
  (custom-set-faces
   '(hl-line ((t (:background "color-237"))))))

(add-hook 'hl-line-mode-hook #'set-highlight-background)

;; css-mode config
(defun set-css-mode-indent ()
  (setq css-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  )

(add-hook 'css-mode-hook #'set-css-mode-indent)
(provide 'general-config)

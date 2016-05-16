(require 'cl)
(require 'package)
;;; depends on racer(Rust): cargo install racer
;;; depends on eslint(JS): npm install -g eslint
;;; depends on tern(JS): npm install -g tern
(defvar my-packages
  '(
    darktooth-theme
    js2-mode
    company
    xclip
    flycheck
    json-reformat
    json-snatcher
    let-alist
    neotree
    pkg-info
    epl
    popup
    racer
    s
    dash
    rust-mode
    seq
    simple-httpd
    solarized-theme
    dash
    tern
    company-tern
    projectile
    web-mode)
 "A list of packages to ensure are installed at lunch.")

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(defun my-packages-installed-p ()
  "Check for uninstalled packages."
  (loop for p in my-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(unless (my-packages-installed-p)
  (package-refresh-contents)
  (dolist (p my-packages)
      (when (not (package-installed-p p))
      (package-install p))))


;; themes
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("98a619757483dc6614c266107ab6b19d315f93267e535ec89b7af3d62fb83cad" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(flycheck-eslintrc "0")
 '(js2-mode-show-parse-errors nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(load-theme 'darktooth t)
;; toggle comment
(defun toggle-comment-on-line ()
  "Comment or uncomment current line."
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))
(global-set-key (kbd "C-c /") #'toggle-comment-on-line)
;; indent related
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'tab-to-tab-stop)
(setq tab-stop-list (number-sequence 4 120 4))
(require 'js2-mode)
(defun js2-mode-hook-fn ()
  "To force add a TAB."
  (define-key js2-mode-map (kbd "C-c TAB") #'tab-to-tab-stop))
(add-hook 'js2-mode-hook 'js2-mode-hook-fn)

(global-set-key [f8] 'neotree-toggle)
(require 'neotree)
(define-key neotree-mode-map (kbd "i") #'neotree-enter-horizontal-split)
(define-key neotree-mode-map (kbd "I") #'neotree-enter-vertical-split)
;; switching windows
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))
;; list buffer
(require 'ido)
(ido-mode 1)
(setq ido-decorations
      (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
;; Rust
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)

(add-hook 'racer-mode-hook #'company-mode)

(require 'company)
;; (defun company-tab-binding ()
;;   "TAB to enable company."
  (define-key company-mode-map (kbd "TAB") #'company-indent-or-complete-common)
  ;; )

;; (add-hook 'company-mode-hook 'company-tab-binding)
(setq company-tooltip-align-annotations t)
;;JS
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))
(add-to-list 'auto-mode-alist '("\\.jsx$" . js2-mode))
(add-hook 'js2-mode-hook #'linum-mode)
(setq js2-highlight-level 3)
(add-hook 'js2-mode-hook #'company-mode)
;;;tern
(require 'tern)
(eval-after-load 'company
  '(add-hook 'js2-mode-hook #'tern-mode))

(require'company-tern)
(add-to-list 'company-backends 'company-tern)

(require 'flycheck)
(add-hook 'js2-mode-hook #'flycheck-mode)
(setq-default flycheck-disabled-checkers
	      (append flycheck-disabled-checkers
		          '(javascript-jshint)))
;; (setq flycheck-eslintrc "~/.eslintrc")
(setq-default js2-global-externs '("describe" "context" "it" "define" "module" "require" "buster" "sinon" "assert" "refute" "setTimeout" "clearTimeout" "setInterval" "clearInterval" "location" "__dirname" "console" "JSON"))
;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'js2-mode)

(xclip-mode 1)

(projectile-global-mode)
(setq projectile-switch-project-action 'neotree-projectile-action)

;; backups
(setq
 vc-make-backup-files t ;; backup version controlled files too.
 version-control t     ;; Use version numbers for backups.
 kept-new-versions 5  ;; Number of newest versions to keep.
 kept-old-versions 0   ;; Number of oldest versions to keep.
 delete-old-versions t ;; Don't ask to delete excess backup versions.
 backup-by-copying t  ;; Copy all files, don't rename them.
 backup-directory-alist '(("" . "~/.emacs.d/backup")) ;; save backup to other directory 
 ) 

(defun force-backup-of-buffer ()
  ;; Make a special "per session" backup at the first save of each
  ;; emacs session.
  (when (not buffer-backed-up)
    ;; Override the default parameters for per-session backups.
    (let ((backup-directory-alist '(("" . "~/.emacs.d/backup/per-session")))
          (kept-new-versions 3))
      (backup-buffer)))
  ;; Make a "per save" backup on each save.  The first save results in
  ;; both a per-session and a per-save backup, to keep the numbering
  ;; of per-save backups consistent.
  (let ((buffer-backed-up nil))
    (backup-buffer)))
(add-hook 'before-save-hook  'force-backup-of-buffer)

;; text editing
(defun start-flyspell-mode ()
  (flyspell-mode 1)
  (visual-line-mode))
(add-hook 'text-mode-hook 'start-flyspell-mode)

;; docker
;; git clone https://github.com/spotify/dockerfile-mode.git
(add-to-list 'load-path "~/.emacs.d/plugins/dockerfile-mode")
(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

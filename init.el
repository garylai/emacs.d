(require 'cl)
(require 'package)

(defvar my-packages
  '(
    darktooth-theme
    js2-mode
    company
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
 '(flycheck-eslintrc "0"))
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
(defun company-tab-binding ()
  "TAB to enable company."
  (global-set-key (kbd "TAB") #'company-indent-or-complete-common))

(add-hook 'company-mode-hook 'company-tab-binding)
(setq company-tooltip-align-annotations t)
;;JS
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))
(add-to-list 'auto-mode-alist '("\\.jsx$" . js2-mode))
(add-hook 'js2-mode-hook #'linum-mode)
(setq js2-highlight-level 3)

(require 'flycheck)
(add-hook 'js2-mode-hook #'flycheck-mode)
(setq-default flycheck-disabled-checkers
	      (append flycheck-disabled-checkers
		          '(javascript-jshint)))
(setq flycheck-eslintrc "~/.eslintrc")
;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'js2-mode)

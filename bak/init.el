(require 'cl)
(require 'package)
;;; depends on racer(Rust): cargo install racer
;;; depends on eslint(JS): npm install -g eslint
;;; depends on tern(JS): npm install -g tern
(defvar my-packages
  '(
    company
    company-tern
    darktooth-theme
    dash
    dash-functional
    dockerfile-mode
    epl
    flycheck
    js-doc
    js2-mode
    json-mode
    json-reformat
    json-snatcher
    let-alist
    neotree
    pkg-info
    popup
    projectile
    racer
    rjsx-mode
    rust-mode
    s
    seq
    simple-httpd
    solarized-theme
    tern
    toml-mode
    web-mode
    xclip
    xah-find
    terraform-mode
    company-terraform
    paredit
    rainbow-delimiters
    )
  "A list of packages to ensure are installed at launch.")

(load-file "~/.emacs.d/third_party_mode/flow-for-emacs/flow.el")
(add-to-list 'load-path "~/.emacs.d/third_party_mode/dockerfile-mode-master/")
(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

(add-to-list 'load-path "~/.emacs.d/third_party_mode/Highlight-Indentation-for-Emacs-master/")

(load "highlight-indentation")
(add-hook 'web-mode-hook #'highlight-indentation-current-column-mode)
(add-hook 'web-mode-hook #'highlight-indentation-mode)
(add-hook 'yaml-mode-hook #'highlight-indentation-current-column-mode)
(add-hook 'yaml-mode-hook #'highlight-indentation-mode)
(add-hook 'yaml-mode-hook #'flycheck-mode)

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
 '(grep-find-ignored-directories
   (quote
    ("SCCS" "RCS" "CVS" "MCVS" ".src" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" "node_modules")))
 '(grep-find-ignored-files
   (quote
    (".#*" "*.o" "*~" "*.bin" "*.lbin" "*.so" "*.a" "*.ln" "*.blg" "*.bbl" "*.elc" "*.lof" "*.glo" "*.idx" "*.lot" "*.fmt" "*.tfm" "*.class" "*.fas" "*.lib" "*.mem" "*.x86f" "*.sparcf" "*.dfsl" "*.pfsl" "*.d64fsl" "*.p64fsl" "*.lx64fsl" "*.lx32fsl" "*.dx64fsl" "*.dx32fsl" "*.fx64fsl" "*.fx32fsl" "*.sx64fsl" "*.sx32fsl" "*.wx64fsl" "*.wx32fsl" "*.fasl" "*.ufsl" "*.fsl" "*.dxl" "*.lo" "*.la" "*.gmo" "*.mo" "*.toc" "*.aux" "*.cp" "*.fn" "*.ky" "*.pg" "*.tp" "*.vr" "*.cps" "*.fns" "*.kys" "*.pgs" "*.tps" "*.vrs" "*.pyc" "*.pyo")))
 '(js2-mode-show-parse-errors nil)
 '(package-selected-packages
   (quote
    (flycheck-flow flymd markdown-mode yaml-mode company-terraform terraform-mode xah-find xclip web-mode toml-mode solarized-theme simple-httpd rjsx-mode racer projectile popup neotree json-mode js-doc flycheck dockerfile-mode darktooth-theme company-tern))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(italic ((t (:underline t)))))
(load-theme 'darktooth t)
;; toggle comment
(defun toggle-comment-on-line ()
  "Comment or uncomment current line."
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))
(global-set-key (kbd "C-c /") #'toggle-comment-on-line)
;; indent related
(setq-default indent-tabs-mode nil)
(setq js2-indent-switch-body t)
(setq js-indent-level 2)
(setq js-switch-indent-offset 2)
(setq-default tab-width 2)
(setq indent-line-function 'tab-to-tab-stop)
(setq tab-stop-list (number-sequence 2 120 2))
(setq
     web-mode-code-indent-offset 2
     web-mode-css-indent-offset 2
     web-mode-markup-indent-offset 2
     web-mode-enable-auto-quoting nil)

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
(add-to-list 'auto-mode-alist '("\\.js$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(setq js2-highlight-level 3)
(add-hook 'js2-mode-hook #'company-mode)
(add-hook 'web-mode-hook #'company-mode)

(setq js-doc-mail-address "gary.lai@infinitus-int.com"
      js-doc-author (format "GaryLai <%s>" js-doc-mail-address)
      js-doc-url "url of your website"
       js-doc-license "license name")

 (add-hook 'js2-mode-hook
           #'(lambda ()
               (define-key js2-mode-map "\C-ci" 'js-doc-insert-function-doc)
               (define-key js2-mode-map "@" 'js-doc-insert-tag)))
;;;tern
(require 'tern)
(eval-after-load 'company
  '(add-hook 'js2-mode-hook #'tern-mode))
(eval-after-load 'company
  '(add-hook 'web-mode-hook #'tern-mode))

(require'company-tern)
(add-to-list 'company-backends 'company-tern)

(require 'flycheck-flow)
(require 'flycheck)
(add-hook 'sh-mode-hook #'flycheck-mode)
(add-hook 'js2-mode-hook #'flycheck-mode)
(add-hook 'web-mode-hook #'flycheck-mode)
(setq-default flycheck-disabled-checkers
	      (append flycheck-disabled-checkers
		          '(javascript-jshint)))
;; (setq flycheck-eslintrc "~/.eslintrc")
(setq-default js2-global-externs '("describe" "context" "it" "define" "module" "require" "buster" "sinon" "assert" "refute" "setTimeout" "clearTimeout" "setInterval" "clearInterval" "location" "__dirname" "console" "JSON"))
;; use eslint with web-mode for jsx files
;; (flycheck-add-mode 'javascript-eslint 'js2-mode)

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

;; linum-mode
;; (setq linum-format "%4d \u2502 ")
;; (add-hook 'js2-mode-hook #'linum-mode)
;; (add-hook 'web-mode-hook #'linum-mode)
;; (add-hook 'sh-mode-hook #'linum-mode)


(setq-default js2-strict-trailing-comma-warning nil) 
;; (defun my/use-eslint-from-node-modules ()
;;   (let ((root (locate-dominating-file
;;                (or (buffer-file-name) default-directory)
;;                (lambda (dir)
;;                  (let ((eslint (expand-file-name "node_modules/eslint/bin/eslint.js" dir)))
;;                   (and eslint (file-executable-p eslint)))))))
;;     (when root
;;       (let ((eslint (expand-file-name "node_modules/eslint/bin/eslint.js" root)))
;;         (setq-local flycheck-javascript-eslint-executable eslint)))))
;; (add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)
(put 'upcase-region 'disabled nil)

;; terraform
(require 'company-terraform)
(company-terraform-init)

;;web-mode
(add-hook 'web-mode-hook #'hs-minor-mode)
(defun hs-minor-mode-hook-fn ()
  (define-key hs-minor-mode-map (kbd "C-c C-e") #'hs-hide-block)
  (define-key hs-minor-mode-map (kbd "C-c C-o") #'hs-show-block))
(add-hook 'hs-minor-mode-hook 'hs-minor-mode-hook-fn)

(with-eval-after-load 'web-mode
  (setf (cdr (assoc "lineup-args" web-mode-indentation-params)) nil)
  (setf (cdr (assoc "lineup-concats" web-mode-indentation-params)) nil)
  (setf (cdr (assoc "lineup-calls" web-mode-indentation-params)) nil)
  (setf (cdr (assoc "lineup-ternary" web-mode-indentation-params)) nil)
  (add-to-list 'web-mode-content-types '("javascript" . "\\.es6\\'"))
  (add-to-list 'web-mode-content-types '("jsx" . "\\.jsx?\\'"))
  )
(with-eval-after-load 'flycheck
  (flycheck-add-mode 'javascript-eslint 'web-mode)
  (flycheck-add-mode 'javascript-jshint 'web-mode)
  (flycheck-add-mode 'javascript-flow 'web-mode)
  (flycheck-add-mode 'javascript-standard 'web-mode))


(defun my-flymd-browser-function (url)
  (let ((process-environment (browse-url-process-environment)))
    (apply 'start-process
           (concat "firefox " url)
           nil
           "/usr/bin/open"
           (list "-a" "firefox" url))))
(setq flymd-browser-open-function 'my-flymd-browser-function)

(defun aj-toggle-fold ()
  "Toggle fold all lines larger than indentation on current line"
  (interactive)
  (let ((col 1))
    (save-excursion
      (back-to-indentation)
      (setq col (+ 1 (current-column)))
      (set-selective-display
       (if selective-display nil (or col 1))))))
(global-set-key (kbd "C-c f") 'aj-toggle-fold)

(add-hook 'emacs-lisp-mode-hook #'global-company-mode)
(add-hook 'lisp-interaction-mode #'global-company-mode)

(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (paredit-mode t)
            (rainbow-delimiters-mode t)
            (show-paren-mode 1)
            ))

(add-hook 'lisp-interaction-mode
          (lambda ()
            (paredit-mode t)
            (rainbow-delimiters-mode t)
            (show-paren-mode 1)
            ))

(require 'ielm)

(defun ielm/clear-repl ()
  "Clear current REPL buffer."
  (interactive)
  (let ((inhibit-read-only t))
      (erase-buffer)
      (ielm-send-input)))

(define-key inferior-emacs-lisp-mode-map
  (kbd "M-RET")
  #'ielm-return)

(define-key inferior-emacs-lisp-mode-map
  (kbd "C-j")
  #'ielm-return)

(define-key inferior-emacs-lisp-mode-map
  (kbd "RET")
  #'electric-newline-and-maybe-indent)

(define-key inferior-emacs-lisp-mode-map
  (kbd "<up>")
  #'previous-line)

(define-key inferior-emacs-lisp-mode-map
  (kbd "<down>")
  #'next-line)

(define-key inferior-emacs-lisp-mode-map
  (kbd "C-c C-q")
  #'ielm/clear-repl
  )

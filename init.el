(setq lexical-binding t)

(defvar native-comp-deferred-compilation-deny-list nil)
(setq package-enable-at-startup nil)
(setq inhibit-startup-message t)
(setq find-file-visit-truename t)

;; (desktop-save-mode 1)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(straight-use-package 'dash)
(straight-use-package 'dash-functional)
(straight-use-package 'epl)

(unless (package-installed-p 'quelpa)
  (with-temp-buffer
    (url-insert-file-contents "https://raw.githubusercontent.com/quelpa/quelpa/master/quelpa.el")
    (eval-buffer)
    (quelpa-self-upgrade)))

(quelpa
 '(quelpa-use-package
   :fetcher git
   :url "https://github.com/quelpa/quelpa-use-package.git"))
(require 'quelpa-use-package)

(add-to-list 'load-path (concat user-emacs-directory
                                (convert-standard-filename "configs")))

(add-to-list 'load-path (concat user-emacs-directory
                                (convert-standard-filename "lisp")))

(use-package backup-config)
(use-package general-config)
(use-package dockerfile-config)
(use-package navigation-config)
(use-package typescript-config)
(use-package ivy-config)
(use-package js-config)
(use-package elisp-config)
(use-package yaml-config)
(use-package rust-config)
(use-package text-config)
(use-package terraform-config)
(use-package md-config)
(use-package ielm-config)
(use-package lsp-config)
(use-package graphql-config)
(use-package org-config)
(use-package groovy-config)
(use-package centaur-tabs-config)
(use-package vterm-config)
(use-package magit-config)
(use-package atomic-chrome-config)
(use-package pandoc-config)
(use-package csharp-config)
(use-package mermaid-config)
(use-package indium-config)
(use-package apex-config)
(use-package xml-config)
(use-package copilot-config)
(use-package php-config)

(setq interpreter-mode-alist (rassq-delete-all 'js-mode interpreter-mode-alist))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(groovy-indent-offset 4)
 '(lsp-pylsp-plugins-yapf-enabled t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-error-list-warning ((t (:foreground "color-220" :weight bold))))
 '(flycheck-fringe-warning ((t (:foreground "color-220"))))
 '(git-gutter:added ((t (:background "gray25" :foreground "#878700"))))
 '(git-gutter:deleted ((t (:background "gray25" :foreground "#870000"))))
 '(git-gutter:modified ((t (:background "gray25" :foreground "#875f87"))))
 '(hl-line ((t (:background "gray25"))))
 '(lsp-face-highlight-read ((t (:inherit highlight))))
 '(lsp-ui-peek-peek ((t (:background "#181818"))))
 '(lsp-ui-sideline-current-symbol ((t (:foreground "light cyan" :box nil :weight ultra-bold :height 0.99))))
 '(lsp-ui-sideline-symbol ((t (:foreground "dim gray" :box nil :height 0.99))))
 '(lsp-ui-sideline-symbol-info ((t (:foreground "light blue" :slant italic :height 0.99))))
 '(vterm-color-black ((t (:background "gray72" :foreground "black")))))

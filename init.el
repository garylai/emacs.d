(setq lexical-binding t)

(setq package-enable-at-startup nil)
(setq inhibit-startup-message t)
(setq find-file-visit-truename t)
(setq initial-buffer-choice  "~/org/work.org")


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

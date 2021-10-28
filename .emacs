(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")
(load "nextflow-mode")
;; setup files ending in “.js” to open in js2-mode
(add-to-list 'auto-mode-alist '("\\.nf\\'" . nextflow-mode))

;; appearance
(set-face-attribute 'default nil :height 140)
(setq inhibit-startup-screen t)
(setq visible-bell t)
(tool-bar-mode -1)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; use view-mode for read only files (e.g. R help)
(setq view-read-only t)

;; org mode
(global-set-key "\C-ca" 'org-agenda)

;; hard wrap text files, don't wrap code
(setq-default fill-column 80)
(add-hook 'text-mode-hook #'auto-fill-mode)
(add-to-list 'auto-mode-alist '("\\.md\\'" . text-mode))
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)

;; fancier completion
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; backup locally!
(setq backup-directory-alist `(("." . "~/.saves")))
(setq version-control t     ;; Use version numbers for backups.
      kept-new-versions 10  ;; Number of newest versions to keep.
      kept-old-versions 0   ;; Number of oldest versions to keep.
      delete-old-versions t ;; Don't ask to delete excess backup versions.
      backup-by-copying t)  ;; Copy all files, don't rename them.
(setq vc-make-backup-files t)

;; tabs are evil
(defun untabify-except-makefiles ()
  "Replace tabs with spaces except in makefiles."
  (unless (derived-mode-p 'makefile-mode)
    (untabify (point-min) (point-max))))

(add-hook 'before-save-hook 'untabify-except-makefiles)

;; additional packages
(use-package modus-themes
  :ensure t
  :config
  (load-theme 'modus-vivendi t))

(use-package ess
  :ensure t
  :init (require 'ess-site)
  :pin melpa)

(use-package poly-R
  :ensure t
  :pin melpa)

(use-package magit
  :ensure t
  :pin melpa)

(use-package org
  :ensure t
  :config
  (global-set-key (kbd "C-c l") 'org-store-link)
  (global-set-key (kbd "C-c a") 'org-agenda)
  (global-set-key (kbd "C-c c") 'org-capture)
  )

(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
  )

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package ws-butler
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'ws-butler-mode)
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(global-flycheck-mode t)
 '(org-agenda-files '("~/Documents/org/2021-october.org"))
 '(package-selected-packages
   '(ws-butler groovy-mode flycheck rainbow-delimiters modus-themes magit poly-R ess zenburn-theme use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq comp-deferred-compilation t)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;; appearance
(set-face-attribute 'default nil :height 180)
(setq inhibit-startup-screen t)
(setq visible-bell t)
(tool-bar-mode -1)

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

;; additional packages
(use-package zenburn-theme
  :ensure t
  :pin melpa
  :config
  (load-theme 'zenburn t))

(use-package ess
  :ensure t
  :pin melpa)

(use-package poly-R
  :ensure t
  :pin melpa)

(use-package magit
  :ensure t
  :pin melpa)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(zenburn-theme zenburn magit solarized-light ess use-package solarized-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

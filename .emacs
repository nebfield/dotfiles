(setq comp-deferred-compilation t)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;; themes and stuff
(load-theme 'solarized-light t)
(set-face-attribute 'default nil :height 180)
(setq inhibit-startup-screen t)
(tool-bar-mode -1)

;; org mode
(global-set-key "\C-ca" 'org-agenda)

;; hard wrap text files, don't wrap code
(setq-default fill-column 80)
(add-hook 'text-mode-hook #'auto-fill-mode)
(add-to-list 'auto-mode-alist '("\\.md\\'" . text-mode))
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)

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

(use-package poly-R
  :ensure t
  :pin melpa)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(use-package poly-R polymode ess solarized-theme magit)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

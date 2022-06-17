(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; appearance
(if (eq system-type 'darwin)
    (set-face-attribute  'default nil :family "Monaco" :height 160)
  (set-face-attribute 'default nil :height 140))

(setq inhibit-startup-screen t)
(setq visible-bell nil)
(tool-bar-mode -1)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; use view-mode for read only files (e.g. R help)
(setq view-read-only t)

;; org mode
(global-set-key "\C-ca" 'org-agenda)

;; hard wrap text files, don't wrap code
(setq-default fill-column 80)
(add-hook 'text-mode-hook #'auto-fill-mode)
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)

;; fancier completion
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; backup locally!
(setq auto-save-file-name-transforms
          `((".*" ,(concat user-emacs-directory "auto-save/") t)))

;; tabs are evil
(defun untabify-except-makefiles ()
  "Replace tabs with spaces except in makefiles."
  (unless (derived-mode-p 'makefile-mode)
    (untabify (point-min) (point-max))))

(add-hook 'before-save-hook 'untabify-except-makefiles)

(setq mac-option-key-is-meta nil
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-option-modifier 'none)

;; break bad habits
(global-unset-key (kbd "<left>"))
(global-unset-key (kbd "<right>"))
(global-unset-key (kbd "<up>"))
(global-unset-key (kbd "<down>"))
(global-unset-key (kbd "<C-left>"))
(global-unset-key (kbd "<C-right>"))
(global-unset-key (kbd "<C-up>"))
(global-unset-key (kbd "<C-down>"))
(global-unset-key (kbd "<M-left>"))
(global-unset-key (kbd "<M-right>"))
(global-unset-key (kbd "<M-up>"))
(global-unset-key (kbd "<M-down>"))

;; additional packages
(use-package modus-themes
  :ensure t
  :config
  (load-theme 'modus-vivendi t))

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
  :init (global-flycheck-mode)
  :config (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
  )

(use-package ws-butler
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'ws-butler-mode)
  )

(use-package vertico
  :ensure t
  :init (vertico-mode)
  )

(use-package savehist
  :ensure t
  :init
  (savehist-mode))

(use-package emacs
  :init
  ;; Add prompt indicator to `completing-read-multiple'.
  ;; Alternatively try `consult-completing-read-multiple'.
  (defun crm-indicator (args)
    (cons (concat "[CRM] " (car args)) (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  ;; Emacs 28: Hide commands in M-x which do not work in the current mode.
  ;; Vertico commands are hidden in normal buffers.
  (setq read-extended-command-predicate
        #'command-completion-default-include-p)

  (setq enable-recursive-minibuffers t)
  )

(use-package yaml-mode
  :ensure t
  )

(use-package groovy-mode
  :ensure t
  )

(use-package nextflow-mode
  :load-path "/home/benjamin/.emacs.d/lisp/"
  :mode "\\.nf\\'")

(use-package groovy-nf
  :after (groovy-mode nextflow))

(use-package yaml-mode
  :mode "\\.yaml\\'")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files '("~/Documents/org/2022-april.org"))
 '(package-selected-packages
   '(vertico groovy-mode yaml-mode ws-butler use-package rainbow-delimiters poly-R modus-themes magit flycheck ess)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

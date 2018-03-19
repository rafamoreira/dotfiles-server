(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("45482e7ddf47ab1f30fe05f75e5f2d2118635f5797687e88571842ff6f18b4d5" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "e11569fd7e31321a33358ee4b232c2d3cf05caccd90f896e1df6cab228191109" "291588d57d863d0394a0d207647d9f24d1a8083bb0c9e8808280b46996f3eb83" default)))
 '(package-selected-packages
   (quote
    (undo-tree color-theme-sanityinc-tomorrow zenburn-theme moe-theme dracula-theme counsel-projectile counsel ivy projectile molokai-theme color-theme-modern auto-complete ace-window org-bullets which-key try use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:foreground "#DCDCCC" :background "#3F3F3F"))))
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))


(setq inhibit-startup-message t) ;; do not exibit the inicial message
(tool-bar-mode -1)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 3.0)))))
    ))

(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    ))

(use-package color-theme-modern
  :ensure t)

(use-package molokai-theme
  :ensure t)

(use-package dracula-theme
  :ensure t)

(use-package moe-theme
  :ensure t)

(use-package zenburn-theme
  :ensure t)

(use-package color-theme-sanityinc-tomorrow
  :ensure t)

(use-package projectile
  :ensure t
  :config (projectile-mode))

(use-package ivy
	     :ensure t)

(use-package counsel
  :ensure t)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)


(use-package counsel-projectile
  :ensure t
  :config (counsel-projectile-mode))

(use-package undo-tree
  :ensure t)



;; ido configs
(setq indo-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(defalias 'list-buffers 'ibuffer)

(load-theme 'railscast)
(set-frame-font "Dejavu sans mono 12" nil t)
(global-hl-line-mode t) ;; hightlight the current line
(electric-pair-mode 1) ;; auto add matching pair
(show-paren-mode 1) ;; hightlight matching parens
(global-linum-mode 1) ;; show line numbers
(column-number-mode 1) ;; show column number
(save-place-mode 1) ;; remeber cursos position
(setq backup-directory-alist '(("" . "~/.emacs.d/emacs-backup")))
(savehist-mode 1) ;; save minibuffer history
(delete-selection-mode 1) ;; type over selected text

;; tabs / spaces
(progn
  ;; make indentation commands use space only (never tab character)
  (setq-default indent-tabs-mode nil)
  ;; emacs 23.1, 24.2, default to t
  ;; if indent-tabs-mode is t, it means it may use tab, resulting mixed space and tab
  )

;; make return key also do indent, globally
(electric-indent-mode 1)

;; make tab key do indent first then completion.
(setq-default tab-always-indent 'complete)

;; undo tree
(global-undo-tree-mode 1)
(setq undo-tree-auto-save-history t)
(setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo")))

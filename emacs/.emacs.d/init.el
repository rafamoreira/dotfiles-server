;; load emacs 24's package system. Add MELPA repository.
(require 'package)

(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))

(add-to-list 'package-archives '("marmalade" . "httpsl://marmalade-repo.org/packages"))

(package-initialize)

(require 'cl-lib) ;; dont know what this do

(defvar my-packages
  '(undo-tree railscasts-theme)
  "A list of packages to ensure are installed at launch.")

(defun my-packages-installed-p ()
  (cl-loop for p in my-packages
           when (not (package-installed-p p)) do (cl-return nil)
           finally (cl-return t)))

(unless (my-packages-installed-p)
  ;; check for new packages (versions)
  (package-refresh-contents)
  ;; install missing packages
  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3b0a350918ee819dca209cec62d867678d7dac74f6195f5e3799aa206358a983" default)))
 '(package-selected-packages (quote (railscasts-theme undo-tree))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(global-set-key (kbd "C-x C-b") 'ibuffer) ;; default to ibuffer
(global-hl-line-mode 1) ;; turn on highlight for the current line
(global-linum-mode 1) ;; always display line numbers
(column-number-mode 1) ;; always show the column number
(show-paren-mode 1) ;; highlight matching parenthesis
(save-place-mode 1) ;; remember cursor position
(load-theme 'railscasts)
;; set font type and size 
(when (member "DejaVu Sans Mono" (font-family-list))
  (set-face-attribute 'default nil :font "DejaVu Sans Mono-12"))

;; backup in one place. flat, no tree structure
(setq backup-directory-alist '(("" . "~/.emacs.d/emacs-backup")))
(savehist-mode 1) ;; save minibuffer history


;; code preferences
(electric-pair-mode 1) ;; auto insert the closing match (), {} and so on.
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

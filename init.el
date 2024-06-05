;; Package management
(setq package-archives '(("melpa" . "http://melpa.org/packages/")))

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

(use-package smex
  :straight t
  :bind ("M-x" . smex))

(use-package which-key
  :straight t
  :init
  (setq which-key-idle-delay 0.8)
  (setq which-key-idle-secondary-delay 0.2)
  (which-key-mode)
  :config
  (setq which-key-popup-type 'minibuffer))

(use-package ace-window
  :straight t
  :init (setq aw-dispatch-always t)
  :bind ("M-o" . ace-window)
  )

(use-package org-roam
  :straight t
  :custom (org-roam-directory "C:/Users/geric/MyDocs/notes")
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n l" . org-roam-node-insert))
  :config (org-roam-setup)
  :ensure t)

(use-package arduino-mode
  :straight t
  :mode "\\.ino\\'")

(use-package olivetti
  :straight t)

;; theme config


;; setup

;; vistual look
(load-theme 'tango-dark t)
(setq inhibit-startup-message t)
(set-frame-parameter (selected-frame) 'alpha '(90 . 90))
(set-face-attribute 'default nil :font "OpenDyslexicMono" :height 80)
(toggle-frame-maximized)
(tool-bar-mode -1)


(scroll-bar-mode -1)
(global-display-line-numbers-mode 1)

(electric-pair-mode 1)

;; settings
(setenv "COMSPEC" "cmd.exe")
(setq ring-bell-function 'ignore)
(setq display-line-numbers-type 'relative)
(setq make-backup-files nil)
(setq default-directory "C:/Users/geric/MyDocs")
(setq auto-save-defaulft nil)
(setq which-key-use-C-h-commands nil)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq-default olivetti-body-width 120)
(setq-default olivetti-style 'fancy)
(setq org-agenda-files '("C:/Users/geric/MyDocs/agenda"))

(auto-save-mode 0)

(auto-save-visited-mode -1)

;; ido mode
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-separator "\n")

;; hooks
(defun org-mode-hook-fun ()
  (olivetti-mode 1)
  (visual-line-mode 1)
  (display-line-numbers-mode 0)
  (org-indent-mode 1))

(defun nroff-mode-hook-fun ()
  (olivetti-mode 1)
  (visual-line-mode 1)
  (display-line-numbers-mode 0))

(add-hook 'org-mode-hook 'org-mode-hook-fun)
(add-hook 'nroff-mode-hook 'nroff-mode-hook-fun)
;; (add-hook 'org-mode-hook 'olivetti-mode)
;; (add-hook 'org-mode-hook 'visual-line-mode)

;; keys
(setq nav-mag-map (make-sparse-keymap))
(setq nav-mag-d-map (make-sparse-keymap))
(setq nav-mag-w-map (make-sparse-keymap))

(define-key nav-mag-d-map (kbd "C-d") 'kill-whole-line)
(define-key nav-mag-d-map (kbd "C-w") 'kill-word)
(define-key nav-mag-d-map (kbd "C-r") 'kill-region)

(defun nav-mag-open-conf ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(define-key nav-mag-w-map (kbd "e") 'nav-mag-open-conf)

(define-key nav-mag-map (kbd "C-h") 'backward-char)
(define-key nav-mag-map (kbd "C-l") 'forward-char)
(define-key nav-mag-map (kbd "C-j") 'next-line)
(define-key nav-mag-map (kbd "C-k") 'previous-line)
(define-key nav-mag-map (kbd "M-h") 'backward-word)
(define-key nav-mag-map (kbd "M-l") 'forward-word)
(define-key nav-mag-map (kbd "M-j") 'forward-paragraph)
(define-key nav-mag-map (kbd "M-k") 'backward-paragraph)
(define-key nav-mag-map (kbd "C-u") 'undo)
(define-key nav-mag-map (kbd "M-u") 'undo-redo)
(define-key nav-mag-map (kbd "C-q") help-map)
(define-key nav-mag-map (kbd "C-p") 'yank)
(define-key nav-mag-map (kbd "C-y") 'kill-ring-save)
(define-key nav-mag-map (kbd "C-v") 'set-mark-command)
(define-key nav-mag-map (kbd "C-d") nav-mag-d-map)
(define-key nav-mag-map (kbd "M-d") 'delete-char)
(define-key nav-mag-map (kbd "C-w") nav-mag-w-map)



(define-minor-mode nav-mag-mode
  nil
  :global t
  :lighter " navigator"
  :keymap nav-mag-map)

(nav-mag-mode 1)
;;keybinds
;; # orig
;;   C-l => recenter-top-bottom
;;   C-k => kill-line
;;   C-j => electric-newline-and-maybe-indent
;;   C-h => {help prefix}

;;   A-l => downcase-word
;;   A-h => mark-paragraph

;;   C-u => universal-argument
;;   A-u => upcase-word


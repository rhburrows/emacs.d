(use-package emacs
  :config
  ; General UI related settings
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (setq inhibit-splash-screen t)
  (setq initial-scratch-message nil)
  (setq visible-bell t)
  (display-time-mode t)
  (defalias 'yes-or-no-p 'y-or-n-p)
  (set-face-attribute 'default nil
                      :family "Fira Code"
                      :height 140
                      :weight 'normal
                      :width 'normal)

  
  ; Settings related to text editing
  (global-display-line-numbers-mode 1)
  (setq column-number-mode t)
  (setq-default indent-tabs-mode nil)
  (setq-default tab-width 2)
  (require 'whitespace)
  (setq whitespace-line-column 80)
  (setq whitespace-style '(face tabs empty trailing lines-tail))
  (electric-pair-mode t)
  (show-paren-mode t)

  (set-charset-priority 'unicode)
  (setq locale-coding-system 'utf-8
	coding-system-for-read 'utf-8
	coding-system-for-write 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (set-keyboard-coding-system 'utf-8)
  (set-selection-coding-system 'utf-8)
  (prefer-coding-system 'utf-8)
  (setq default-process-coding-system '(utf-8-unix . utf-8-unix))

  ; Misc
  (global-auto-revert-mode t)
  (setq global-auto-revert-non-file-buffers t)
  (setq make-backup-files nil)
  (setq auto-save-default nil))

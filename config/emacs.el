(use-package emacs
  :custom
  (inhibit-splash-screen t)
  (initial-scratch-message nil)
  (visible-bell t)
  (column-number-mode t)
  (whitespace-line-column 80)
  (whitespace-style '(face tabs empty trailing lines-tail))
  (locale-coding-system 'utf-8)
  (coding-system-for-read 'utf-8)
  (default-process-coding-system '(utf-8-unix . utf-8-unix))
  (global-auto-revert-non-file-buffers t)
  (make-backup-files nil)
  (auto-save-default nil)
  (tab-width 2)
  (indent-tabs-mode nil)
  (xref-search-program 'ripgrep)
  (frame-resize-pixelwise t)

  :config
  (require 'whitespace)
  (defalias 'yes-or-no-p 'y-or-n-p)
  (windmove-default-keybindings)

  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (display-time-mode t)
  (global-display-line-numbers-mode 1)
  (electric-pair-mode t)
  (show-paren-mode t)
  (global-auto-revert-mode t)

  (set-charset-priority 'unicode)

  :bind (
         ("M-o" . other-window)))

(use-package which-key
  :demand
  :config
  (which-key-mode))

(use-package eldoc
  :init
  (global-eldoc-mode))

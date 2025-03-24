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
  (repeat-mode)

  (set-charset-priority 'unicode))

(use-package which-key
  :demand
  :config
  (which-key-mode))

(use-package eldoc
  :init
  (global-eldoc-mode))

(use-package ace-window
  :config
  (global-set-key (kbd "M-o") 'ace-window))

(use-package devil
  :config
  (defvar movement-repeat-map
    (let ((map (make-sparse-keymap)))
      (define-key map (kbd "p") #'previous-line)
      (define-key map (kbd "n") #'next-line)
      (define-key map (kbd "b") #'backward-char)
      (define-key map (kbd "f") #'forward-char)
      map))
  (dolist (cmd '(previous-line next-line backward-char forward-char))
    (put cmd 'repeat-map 'movement-repeat-map))
  (defvar meta-movement-repeat-map
    (let ((map (make-sparse-keymap)))
      (define-key map (kbd "f") #'forward-word)
      (define-key map (kbd "p") #'backward-word)
      map))
  (dolist (cmd '(forward-word backward-word))
    (put cmd 'repeat-map 'meta-movement-repeat-map))

  (global-devil-mode)

  :custom
  (devil-prompt "\U0001F608 %t"))

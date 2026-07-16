;; -*- lexical-binding: t; -*-

(use-package ibuffer
  :config
  (define-ibuffer-column icon
    (:name "" :inline t)
    (cond
     ((buffer-file-name)
      (nerd-icons-icon-for-buffer))
     (major-mode (nerd-icons-icon-for-mode major-mode))
     (t "")))

  :bind
  (:map global-map ("C-x C-b" . ibuffer))

  :hook
  (ibuffer-mode . hl-line-mode)
  (ibuffer-mode . (lambda ()
                    (display-line-numbers-mode -1)
                    (local-unset-key (kbd "M-o"))))

  :custom
  (ibuffer-expert t)
  (ibuffer-display-summary nil)
  (ibuffer-human-readable-size t)
  (ibuffer-default-shrink-to-minimum-size nil)
  (ibuffer-show-empty-filter-groups nil)
  (ibuffer-formats
   '((mark modified read-only locked " "
           (icon 2 2)
           (name 30 30 :left :elide)
           " "
           (size 9 -1 :right)
           " "
           (mode 16 16 :left :elide)
           " " project-file-relative)
     (mark " "
           (name 16 -1)
           " " filename)))
  (ibuffer-fontification-alist
   '((10 buffer-read-only font-lock-constant-face)
     (15 (and buffer-file-name
	            (string-match ibuffer-compressed-file-name-regexp
			                      buffer-file-name))
	       font-lock-doc-face)
     (20 (or
          (string-match "^\\*" (buffer-name))
          (memq major-mode ibuffer-help-buffer-modes)) font-lock-comment-face)
     (25 (ibuffer-hidden-buffer-p) italic)
     (35 (derived-mode-p 'dired-mode) font-lock-function-name-face)
     (40 (or
          (derived-mode-p 'agent-shell-mode)
          (string-match "^\\*claude-code" (buffer-name)))
         font-lock-string-face)
     (50 (and (boundp 'emacs-lock-mode) emacs-lock-mode) ibuffer-locked-buffer))))

(use-package ibuffer-project
  :hook (ibuffer . (lambda ()
                     (setq ibuffer-filter-groups (ibuffer-project-generate-filter-groups))))

  :custom
  (ibuffer-default-sorting-mode 'project-file-relative))

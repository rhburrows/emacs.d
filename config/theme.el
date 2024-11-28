(use-package doom-themes
  :straight t
  :config
  (load-theme 'doom-tomorrow-night t))

(use-package nerd-icons
  :straight t)

(use-package all-the-icons
  :straight t)

(use-package all-the-icons-dired
  :straight t
  :after (all-the-icons)
  :config
  (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))

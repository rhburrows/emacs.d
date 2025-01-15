(use-package doom-themes
  :init
  (defun rhb/apply-theme (appearance)
    "Load theme, taking current system APPEARANCE into consideration."
    (pcase appearance
      ('light (load-theme 'doom-one-light t))
      ('dark (load-theme 'doom-city-lights t))))
  :custom-face
  (default ((t (:family "Fira Code" :height 140))))

  :config
  (rhb/apply-theme ns-system-appearance)
  (add-hook 'ns-system-appearance-change-functions 'rhb/apply-theme))

(use-package nerd-icons
  :custom
  (nerd-icons-font-family "FiraCode Nerd Font Mono"))

(use-package nerd-icons-dired
  :config
  (add-hook 'dired-mode-hook #'nerd-icons-dired-mode))

(use-package nerd-icons-completion
  :after marginalia
  :config
  (nerd-icons-completion-mode)
  (add-hook 'marginalia-mode-hook #'nerd-icons-completion-marginalia-setup))

(use-package nerd-icons-corfu
  :after corfu
  :config
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

; Update the modeline
(use-package moody
  :config
  (moody-replace-mode-line-front-space)
  (moody-replace-mode-line-buffer-identification)
  (moody-replace-vc-mode))

; But hide the modeline in some modes
(use-package hide-mode-line
  :config
  (add-hook 'eshell-mode-hook #'hide-mode-line-mode)
  (add-hook 'compilation-mode-hook #'hide-mode-line-mode))

(use-package ansi-color
  :config
  (add-hook 'compilation-filter-hook 'ansi-color-compilation-filter))

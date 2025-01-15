(use-package doom-themes
  :init
  (defun rhb/apply-theme (appearance)
    "Load theme, taking current system APPEARANCE into consideration."
    (pcase appearance
      ('light (load-theme 'doom-one-light t))
      ('dark (load-theme 'doom-one t))))
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

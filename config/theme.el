(use-package catppuccin-theme
  :init
  (defun rhb/apply-theme (appearance)
    "Load theme, taking current system APPEARANCE into consideration."
    (pcase appearance
      ('light (setopt catppuccin-flavor 'latte))
      ('dark (setopt catppuccin-flavor 'macchiato)))
    (catppuccin-reload))

  (defun rhb/apply-frame-settings (frame)
    "Apply desired settings to FRAME."
    (with-selected-frame frame
      (set-face-attribute 'default frame :family "Fira Code" :height 140)))

  :custom-face
  (default ((t (:family "Fira Code" :height 140))))

  :config
  (load-theme 'catppuccin :no-confirm)
  (rhb/apply-theme ns-system-appearance)
  (add-hook 'ns-system-appearance-change-functions 'rhb/apply-theme)
  (add-hook 'after-make-frame-functions 'rhb/apply-frame-settings))

(use-package nerd-icons
  :custom
  (nerd-icons-font-family "FiraCode Nerd Font Mono"))

(use-package nerd-icons-dired
  :hook
  (dired-mode . nerd-icons-dired-mode))

(use-package nerd-icons-completion
  :after marginalia
  :hook (marginalia-mode . nerd-icons-completion-marginalia-setup)
  :config
  (nerd-icons-completion-mode))

(use-package nerd-icons-corfu
  :after corfu
  :config
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))


(use-package dashboard
  :after nerd-icons

  :config
  (dashboard-setup-startup-hook)

  :custom
  (dashboard-startup-banner 'logo)
  (dashboard-banner-logo-title nil)
  (dashboard-center-content t)
  (dashboard-set-footer nil)

  (dashboard-display-icons-p t)
  (dashboard-icon-type 'nerd-icons)
  (dashboard-set-heading-icons t)
  (dashboard-set-file-icons t)

  (dashboard-items '((projects . 5)
                     (bookmarks . 5)
                     (recents . 5)
                     (registers . 5))))

;; Update the modeline
(use-package moody
  :config
  (moody-replace-mode-line-front-space)
  (moody-replace-mode-line-buffer-identification)
  (moody-replace-vc-mode))

;; But hide the modeline in some modes
(use-package hide-mode-line
  :hook
  ((eshell-mode . hide-mode-line-mode)
   (vterm-mode . hide-mode-line-mode)
   (compilation-mode . hide-mode-line-mode)))

(defvar rhb/mode-line-exclude-modes
  '(devil-mode
    org-remark-mode
    org-remark-global-tracking-mode
    gcmh-mode
    undo-tree-mode
    which-key-mode
    rainbow-mode
    eldoc-mode)
  "Minor modes to hide from the mode line.")

(defun rhb/hide-minor-modes ()
  "Remove selected minor modes from `minor-mode-alist`."
  (dolist (mode rhb/mode-line-exclude-modes)
    (setq minor-mode-alist
          (assq-delete-all mode minor-mode-alist))))

(add-hook 'after-change-major-mode-hook #'rhb/hide-minor-modes)

(use-package ansi-color
  :config
  (add-hook 'compilation-filter-hook 'ansi-color-compilation-filter))

(use-package pulsar
  :custom
  (pulsar-pulse t)
  (pulsar-delay 0.04)
  (pulsar-face 'pulsar-cyan)

  :config
  (pulsar-global-mode 1)

  :hook
  (next-error-hook . pulsar-pulse-line)
  (consult-after-jump-hook . pulsar-recenter-top)
  (consult-after-jump-hook . pulsar-reveal-entry))

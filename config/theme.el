;;;; This is all the user interface changes that are not tied to mode
(setq inhibit-splash-screen t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq column-number-mode t)
(display-time-mode 1)

(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t)
  (setq doom-themes-enable-italic t)
  (doom-themes-visual-bell-config)
  (doom-themes-org-config)
  (setq doom-themes-treemacs-theme "doom-colors")
  (setq doom-themes-treemacs-enable-variable-pitch nil)
  (doom-themes-treemacs-config))

(defun rhb/apply-theme (appearance)
  "Load them, taking curent system APPEARANCE into consideration."
  (mapc #'disable-theme custom-enabled-themes)
  (pcase appearance
    ('light (load-theme 'doom-one-light t))
    ('dark (load-theme 'doom-one t))))

(add-hook 'ns-system-appearance-change-functions #'rhb/apply-theme)

(add-to-list 'default-frame-alist '(font . "Fira Code 12"))
(set-face-attribute 'default t :font "Fira Code 12")

(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))

(global-linum-mode)

(use-package all-the-icons
  :ensure t

  :config
  (use-package all-the-icons-dired
    :ensure t
    :config
    (add-hook 'dired-mode-hook 'all-the-icons-dired-mode)))

(use-package rainbow-mode
  :ensure t
  :config
  (rainbow-mode))

(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

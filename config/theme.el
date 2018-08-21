;;;; This is all the user interface changes that are not tied to mode
(setq inhibit-splash-screen t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq column-number-mode t)
(display-time-mode 1)

(setq doom-themes-enable-bold t
      doom-themes-enable-italic t)
(load-theme 'doom-one t)
(doom-themes-visual-bell-config)
(doom-themes-org-config)
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
(set-default-font "Inconsolata 16")

;;;; This is all the user interface changes that are not tied to mode
(setq inhibit-splash-screen t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq column-number-mode t)
(display-time-mode 1)

(load-theme 'doom-tomorrow-night t)
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
(set-default-font "Fira Code 14")

(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))

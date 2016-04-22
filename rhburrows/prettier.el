(setq inhibit-splash-screen t)

(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(scroll-bar-mode -1)

(require 'hl-line)
(set-face-background 'hl-line "white smoke")

(display-time)

(setq column-number-mode t)

(setq ring-bell-function 'ignore)
(setq make-backup-files nil)

(require 'color-theme)
(color-theme-solarized)

(load-theme 'zenburn)
(set-face-background 'vertical-border "black")
(set-face-foreground 'vertical-border "black")
(require 'hl-line)
(set-face-background 'hl-line "gray17")

(display-time)

(setq column-number-mode t)

(setq ring-bell-function 'ignore)

(add-hook 'org-mode-hook 'org-table-stripes-enable)
(add-hook 'org-mode-hook 'org-bullets-mode)
(add-hook 'dired-mode-hook 'stripe-listify-buffer)

(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(global-set-key (kbd "C-c t") #'helm-mt)
(global-set-key (kbd "C-x b") #'helm-mini)

(helm-mode 1)

(helm-projectile-on)
(helm-mt/reroute-terminal-functions t)

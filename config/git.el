(use-package magit
  :straight t
  :config
  (global-set-key (kbd "C-x g") 'magit-status))

(use-package diff-hl
  :straight t
  :init
  (add-hook 'magit-pre-refresh-hook 'diff-hl-magit-pre-refresh)
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
  :config
  (global-diff-hl-mode))

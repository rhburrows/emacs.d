;; -*- lexical-binding: t; -*-

(use-package magit
  :custom
  (magit-diff-refine-hunk 'all)
  (magit-diff-specify-hunk-foreground nil)
  (magit-diff-fontify-hunk 'all)
  (magit-diff-use-indicator-faces t)

  :config
  (global-set-key (kbd "C-x g") 'magit-status))

(use-package diff-hl
  :init
  (add-hook 'magit-pre-refresh-hook 'diff-hl-magit-pre-refresh)
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
  :config
  (global-diff-hl-mode))

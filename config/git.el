;; -*- lexical-binding: t; -*-

(use-package magit
  :demand t
  :bind (
         :map project-prefix-map
         ("g" . magit-project-status))

  :custom
  (magit-diff-refine-hunk 'all)
  (magit-diff-specify-hunk-foreground nil)
  (magit-diff-fontify-hunk 'all)
  (magit-diff-use-indicator-faces t)
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1)

  :config
  (global-set-key (kbd "C-x g") 'magit-status)
  (add-to-list 'project-switch-commands '(magit-project-status "Magit") t))

(use-package diff-hl
  :init
  (add-hook 'magit-pre-refresh-hook 'diff-hl-magit-pre-refresh)
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
  :config
  (global-diff-hl-mode))

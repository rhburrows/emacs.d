(use-package undo-tree
  :custom
  (undo-tree-enable-undo-in-region t)
  (undo-tree-auto-save-history nil)

  :config
  (global-undo-tree-mode))

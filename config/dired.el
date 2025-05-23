(use-package dired
  :defer t
  :straight (compile :type built-in)
  :custom
  (dired-auto-revert-buffer t)
  (dired-recursive-copies 'always)
  (dired-use-ls-dired nil)
  (dired-vc-rename-file t))

(use-package dired-subtree
  :bind
  (:map dired-mode-map ("i" . dired-subtree-toggle))

  :custom
  (dired-subtree-use-backgrounds nil))

(use-package dired-narrow
  :bind
  (:map dired-mode-map ("/" . dired-narrow-fuzzy)))

(use-package diredfl
  :custom
  (diredfl-global-mode t))

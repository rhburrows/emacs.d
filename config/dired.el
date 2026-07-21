;; -*- lexical-binding: t; -*-

(use-package dired
  :straight (compile :type built-in)
  :ensure t
  :custom
  (dired-recursive-copies 'always)
  (dired-use-ls-dired nil)
  (dired-vc-rename-file t))

(use-package dired-subtree
  :ensure t
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

(use-package yaml-mode
  :init
  (rhb/treesit-install-grammar 'yaml))

(use-package yaml-ts-mode
  :mode "\\.ya?ml\\'")

(use-package yaml-pro
  :after yaml-mode
  :mode "\\.ya?ml\\'"

  :hook (yaml-ts-mode . yaml-pro-ts-mode)

  :bind (:map yaml-pro-ts-mode-map
              ("C-c C-f" . yaml-pro-format)))

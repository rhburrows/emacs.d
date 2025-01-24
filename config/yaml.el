(use-package yaml-ts-mode
  :init
  (rhb/treesit-install-grammar 'yaml)
  :mode "\\.ya?ml\\'")

(use-package yaml-pro
  :hook (yaml-ts-mode . yaml-pro-ts-mode)

  :bind (:map yaml-pro-ts-mode-map
              ("C-c C-f" . yaml-pro-format)))

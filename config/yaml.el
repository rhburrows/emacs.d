;; -*- lexical-binding: t; -*-

(use-package yaml-ts-mode
  :mode "\\.ya?ml\\'")

(use-package yaml-pro
  :hook (yaml-ts-mode . yaml-pro-ts-mode)

  :bind (:map yaml-pro-ts-mode-map
              ("C-c C-f" . yaml-pro-format)))

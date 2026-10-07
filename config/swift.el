;; -*- lexical-binding: t; -*-

(use-package swift-mode
  :ensure t
  :hook (swift-mode . eglot-ensure))

(use-package eglot
  :ensure nil
  :config
  (add-to-list 'eglot-server-programs
               '((swift-mode swift-ts-mode) . ("xcrun" "sourcekit-lsp"))))

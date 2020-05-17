(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :init (setq lsp-keymap-prefix "C-c l")
  :hook (
         (typescript-mode . lsp-deferred)
         (go-mode . lsp-deferred)
         (lsp-mode . lsp-enable-which-key-integration))

  :config
  (use-package lsp-ui
    :ensure t
    :commands lsp-ui-mode)

  (use-package lsp-ivy
    :ensure t
    :after lsp-mode))

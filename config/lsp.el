(use-package lsp-mode
  :ensure t
  :hook ((typescript-mode . lsp))

  :config
  (use-package lsp-ui
    :ensure t
    )

  (use-package lsp-ivy
    :ensure t
    :after lsp-mode))

(use-package lsp-mode
  :ensure t
  :config

  (use-package lsp-ui
    :ensure t
    )

  (use-package lsp-ivy
    :ensure t
    :after lsp-mode))

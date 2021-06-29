(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :init (setq lsp-keymap-prefix "C-c l")
  :hook (
         (typescript-mode . lsp-deferred)
         (kotlin-mode . lsp-deferred)
         (java-mode . lsp-deferred)
         (web-mode . lsp-deferred)
         (go-mode . lsp-deferred)
         (php-mode . lsp-deferred))

  :config
  (setq lsp-prefer-flymake nil)
  (setq lsp-keep-workspace-alive nil)
  
  (use-package lsp-ui
    :ensure t
    :commands lsp-ui-mode
    :hook (lsp-mode . lsp-ui-mode))

  (use-package lsp-ivy
    :ensure t
    :after lsp-mode))

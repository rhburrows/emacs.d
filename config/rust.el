(use-package rust-mode
  :config
  (rhb/treesit-install-grammar 'rust)

  :custom
  (rust-mode-treesiter-derive t))

(use-package rustic
  :after (rust-mode)

  :custom
  (rustic-cargo-use-last-stored-arguments t)
  (rustic-lsp-client 'eglot)
  (rustic-analyzer-command '("rustup" "run" "stable" "rust-analyzer")))

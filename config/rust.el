(use-package rust-mode
  :init
  (rhb/treesit-install-grammar 'rust)

  :custom
  (rust-mode-treesitter-derive t)

  :hook
  (rust-mode . eglot-ensure)

  :config
  (add-to-list 'eglot-server-programs
               '((rust-ts-mode rust-mode) .
                 ("rust-analyzer" :initializationOptions (:check (:command "clippy"))))))



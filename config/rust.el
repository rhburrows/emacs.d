(use-package rust-mode
  :init
  (rhb/treesit-install-grammar 'rust)

  :custom
  (rust-mode-treesitter-derive t)

  :hook
  ((rust-mode . eglot-ensure)
   (rust-mode . (lambda ()
                  (setq-local corfu-auto t))))

  :config
  (add-to-list 'eglot-server-programs
               '((rust-ts-mode rust-mode) .
                 ("rust-analyzer" :initializationOptions (:check (:command "clippy"))))))



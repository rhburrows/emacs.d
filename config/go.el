(use-package go-ts-mode
  :config
  (rhb/treesit-install-grammar 'go)
  (rhb/treesit-install-grammar 'gomod)

  :mode (("\\.go\\'" . go-ts-mode)
         ("/go\\.mod\\'" . go-mod-ts-mode))

  :hook (go-ts-mode . eglot-ensure)

  :custom
  (go-ts-mode-indent-offset 2))

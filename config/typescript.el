(use-package typescript-ts-mode
  :config
  (rhb/treesit-install-grammar 'typescript)
  (rhb/treesit-install-grammar 'tsx))

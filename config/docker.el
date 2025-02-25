(use-package docker
  :config
  (rhb/treesit-install-grammar 'dockerfile)

  :custom
  (docker-container-default-sort-key '("Created" "Image")))

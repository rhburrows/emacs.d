(use-package projectile
  :ensure t
  :bind
  ("C-c p" . projectile-command-map)
  :config
  (add-to-list 'projectile-globally-ignored-directories "fpkg")
  (add-to-list 'projectile-globally-ignored-directories "node_modules")
  (projectile-mode +1)

  (use-package counsel-projectile
    :ensure t
    :config
    (setq counsel-projectile-switch-project-action 'counsel-projectile-switch-project-action-vc)
    (counsel-projectile-mode))

  (use-package treemacs-projectile
    :ensure t
    :after treemacs
    ))

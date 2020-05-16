(use-package projectile
  :ensure t
  :bind
  ("C-c p" . projectile-command-map)
  :config
  (setq projectile-switch-project-action #'projectile-vc)
  (add-to-list 'projectile-globally-ignored-directories "fpkg")
  (add-to-list 'projectile-globally-ignored-directories "node_modules")
  (projectile-mode +1))

(use-package counsel-projectile
  :ensure t
  :config
  (counsel-projectile-mode))
  

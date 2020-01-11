(projectile-register-project-type 'react-native '("rn-cli.config.js")
                                  :test "yarn test"
                                  :run "react-native run-ios")
(setq projectile-switch-project-action #'projectile-vc)

(add-to-list 'projectile-globally-ignored-directories "fpkg")
(add-to-list 'projectile-globally-ignored-directories "node_modules")

(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

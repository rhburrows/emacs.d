(projectile-register-project-type 'react-native '("rn-cli.config.js")
                                  :test "yarn test"
                                  :run "react-native run-ios")
(setq projectile-switch-project-action #'projectile-vc)

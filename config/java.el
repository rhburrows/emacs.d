(use-package groovy-mode)

(use-package jenkinsfile-mode
  :after groovy-mode
  :straight (jenkinsfile-mode
             :type git
             :host github
             :repo "john2x/jenkinsfile-mode"))

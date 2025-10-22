(use-package kotlin-mode)

(use-package groovy-mode)

(use-package jenkinsfile-mode
  :after groovy-mode
  :straight (jenkinsfile-mode
             :type git
             :host github
             :repo "john2x/jenkinsfile-mode"))

(use-package java-ts-mode
  :after eglot

  :mode (("\\.java\\'" . java-ts-mode))

  :hook ((java-ts-mode . eglot-ensure))

  :config
  (rhb/treesit-install-grammar 'java)
  (add-to-list 'eglot-server-programs
               '(java-mode . (lambda (i p)
                               (list "jdtls"
                                     "-data" (concat (project-root p) "jdtls-data"))))))

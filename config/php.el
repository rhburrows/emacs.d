(use-package eglot
  :config
  (add-to-list 'eglot-server-programs
               '(php-mode . ("intelephense" "--stdio"))))

(use-package php-mode
  :after eglot
  :hook ((php-mode-hook . eglot-ensure)
         (php-mode-hook . (lambda ()
                            (setq-local devdocs-current-docs '("php")))))

  :custom
  (php-mode-coding-style 'psr2))


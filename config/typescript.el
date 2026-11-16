;; -*- lexical-binding: t; -*-

(use-package eglot
  :config
  (add-to-list 'eglot-server-programs
               '(((js-mode :language-id "javascript")
                  (js-ts-mode :language-id "javascript")
                  (tsx-ts-mode :language-id "typescriptreact")
                  (typescript-ts-mode :language-id "typescript")
                  (typescript-mode :language-id "typescript"))
                 . ("npx" "--no-install" "tsc" "--lsp" "--stdio"))))

(use-package devdocs
  :hook ((js-ts-mode typescript-ts-mode tsx-ts-mode)
         . (lambda ()
             (setq-local devdocs-current-docs '("node" "typescript")))))

(use-package js-ts-mode
  :straight nil
  :after eglot

  :mode (("\\.js\\'" . js-ts-mode)
         ("\\.jsx\\'" . js-ts-mode))

  :hook (js-ts-mode . eglot-ensure))

(use-package typescript-ts-mode
  :after eglot

  :mode (("\\.ts\\'" . typescript-ts-mode)
         ("\\.tsx\\'" . tsx-ts-mode))

  :hook ((typescript-ts-mode tsx-ts-mode) . eglot-ensure))

(use-package emacs
  :ensure t
  :config
  (add-to-list 'major-mode-remap-alist '(javascript-mode . js-ts-mode))
  (add-to-list 'major-mode-remap-alist '(js-mode . js-ts-mode))
  (add-to-list 'major-mode-remap-alist '(typescript-mode . typescript-ts-mode)))

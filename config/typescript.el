(use-package eglot
  :config
  (defclass eglot-deno (eglot-lsp-server) ()
    :documentation "A custom class for deno lsp.")

  (cl-defmethod eglot-initialization-options ((server eglot-deno))
    "Passes through require deno initialization options"
    (list :enable t :lint t))
  (add-to-list 'eglot-server-programs
               '((js-ts-mode typescript-ts-mode) . (eglot-deno "deno" "lsp"))))

(use-package typescript-ts-mode
  :after eglot

  :hook ((typescript-ts-mode-hook . eglot-ensure)
         (typescript-ts-mode-hook . (lambda ()
                                      (setq-local devdocs-current-doc '("typescript" "deno~2")))))

  :config
  (rhb/treesit-install-grammar 'javascript)
  (rhb/treesit-install-grammar 'typescript)
  (rhb/treesit-install-grammar 'tsx))

(use-package emacs
  :ensure t
  :config
  (add-to-list 'major-mode-remap-alist '(javascript-mode . js-ts-mode))
  (add-to-list 'major-mode-remap-alist '(js-mode . js-ts-mode))
  (add-to-list 'major-mode-remap-alist '(typescript . typescript-ts-mode)))

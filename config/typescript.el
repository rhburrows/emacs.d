(use-package eglot
  :config
  (defclass eglot-deno (eglot-lsp-server) ()
    :documentation "A custom class for deno lsp.")

  (cl-defmethod eglot-initialization-options ((server eglot-deno))
    (list :enable t :lint t))

  (defun rhb/deno-project-p ()
    (or (locate-dominating-file default-directory "deno.json")
        (locate-dominating-file default-directory "deno.jsonc")))

  (define-minor-mode deno-project-mode
    "Minor mode for Deno projects."
    :lighter " Deno"
    (when deno-project-mode
      (setq-local devdocs-current-doc '("deno~2" "typescript"))
      (setq-local eglot-server-programs
                  (list (cons '(js-ts-mode typescript-ts-mode) '(eglot-deno "deno" "lsp"))))))

  (define-minor-mode node-project-mode
    "Minor mode for Node projects."
    :lighter " Node"
    (when node-project-mode
      (setq-local devdocs-current-doc '("node" "typescript"))
      (setq-local eglot-server-programs
                  (list (cons '(js-ts-mode typescript-ts-mode) '("typescript-language-server" "--stdio"))))))

  (defun rhb/setup-ts-project ()
    (cond
     ((rhb/deno-project-p)
      (deno-project-mode 1))
     (t
      (node-project-mode 1)))))

(use-package js-ts-mode
  :straight nil
  :after eglot

  :mode (("\\.js\\'" . js-ts-mode)
         ("\\.jsx\\'" . js-ts-mode))

  :hook ((js-ts-mode . rhb/setup-ts-project)
         (js-ts-mode . eglot-ensure))

  :config
  (setf (alist-get 'deno-project-mode apheleia-formatters nil nil t) '(denofmt-js))
  (rhb/treesit-install-grammar 'javascript))

(use-package typescript-ts-mode
  :after eglot

  :mode (("\\.ts\\'" . typescript-ts-mode)
         ("\\.tsx\\'" . typescript-ts-mode))

  :hook ((typescript-ts-mode . rhb/setup-ts-project)
         (typescript-ts-mode . eglot-ensure))

  :config
  (rhb/treesit-install-grammar 'typescript)
  (rhb/treesit-install-grammar 'tsx))

(use-package flymake-eslint-local
  :ensure nil
  :straight nil
  :load-path site-lisp-dir
  :config
  (defun rhb/enable-eslint-flymake ()
    "Enable Flymake diagnostics using ESLint in the current buffer."
    (when (derived-mode-p 'typescript-mode 'typescript-ts-mode)
      (flymake-eslint-local-setup)))

  :hook ((eglot-managed-mode . rhb/enable-eslint-flymake)))

(use-package emacs
  :ensure t
  :config
  (add-to-list 'major-mode-remap-alist '(javascript-mode . js-ts-mode))
  (add-to-list 'major-mode-remap-alist '(js-mode . js-ts-mode))
  (add-to-list 'major-mode-remap-alist '(typescript-mode . typescript-ts-mode)))

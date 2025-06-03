(use-package treesit
  :straight (:type built-in)
  :init
  (setq treesit-language-source-alist
        '((dockerfile . ("https://github.com/camdencheek/tree-sitter-dockerfile" "v0.2.0"))
          (go . ("https://github.com/tree-sitter/tree-sitter-go" "v0.23.4"))
          (gomod . ("https://github.com/camdencheek/tree-sitter-gomod" "v1.1.0"))
          (javascript . ("https://github.com/tree-sitter/tree-sitter-javascript" "v0.23.1"))
          (json . ("https://github.com/tree-sitter/tree-sitter-json" "v0.24.8"))
          (rust . ("https://github.com/tree-sitter/tree-sitter-rust" "v0.21.2"))
          (tsx . ("https://github.com/tree-sitter/tree-sitter-typescript" "v0.20.3" "tsx/src"))
          (typescript . ("https://github.com/tree-sitter/tree-sitter-typescript" "v0.20.3" "typescript/src"))
          (yaml . ("https://github.com/tree-sitter-grammars/tree-sitter-yaml" "v0.7.0"))))

  (defun rhb/treesit-install-grammar (grammar)
    "Install Tree-sitter grammar if its absent."
    (interactive "SGrammar: ")
    (unless (treesit-language-available-p grammar)
      (treesit-install-language-grammar grammar)))

  :custom
  (treesit-font-lock-level 4))

(use-package apheleia
  :ensure t

  :hook (prog-mode . apheleia-mode)

  :custom
  (apheleia-mode-lighter nil))

(use-package hl-todo
  :config
  (global-hl-todo-mode t))

(use-package rainbow-mode
  :hook (prog-mode . rainbow-mode))

(use-package compile
  :straight (compile :type built-in)
  :hook (compilation-filter . colorize-compilation-buffer)
  :config
  (require 'ansi-color)
  (defun colorize-compilation-buffer ()
    (let ((inhibit-read-only t))
      (ansi-color-apply-on-region (point-min) (point-max)))))

(use-package prog-mode
  :straight (compile :type built-in)
  :bind
  ((:map prog-mode-map
         ("C-x `" . flymake-goto-next-error))))

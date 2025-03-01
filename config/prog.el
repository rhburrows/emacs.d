(use-package emacs
  :init
  (setq treesit-language-source-alist
        '((dockerfile . ("https://github.com/camdencheek/tree-sitter-dockerfile" "v0.2.0"))
          (json . ("https://github.com/tree-sitter/tree-sitter-json" "v0.24.8"))
          (rust . ("https://github.com/tree-sitter/tree-sitter-rust" "v0.21.2"))
          (tsx . ("https://github.com/tree-sitter/tree-sitter-typescript" "v0.20.3" "tsx/src"))
          (typescript . ("https://github.com/tree-sitter/tree-sitter-typescript" "v0.20.3" "typescript/src"))
          (yaml . ("https://github.com/tree-sitter-grammars/tree-sitter-yaml" "v0.7.0"))))

  (defun rhb/treesit-install-grammar (grammar)
    "Install Tree-sitter grammar if its absent."
    (interactive "SGrammar: ")
    (unless (treesit-language-available-p grammar)
      (treesit-install-language-grammar grammar))))


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

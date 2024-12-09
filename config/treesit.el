(use-package emacs
  :init
  (setq treesit-language-source-alist
        '((rust . ("https://github.com/tree-sitter/tree-sitter-rust" "v0.21.2"))
          (tsx . ("https://github.com/tree-sitter/tree-sitter-typescript" "v0.20.3" "tsx/src"))
          (typescript . ("https://github.com/tree-sitter/tree-sitter-typescript" "v0.20.3" "typescript/src"))))

  (defun rhb/treesit-install-grammar (grammar)
    "Install Tree-sitter grammar if its absent."
    (interactive)
    (unless (treesit-language-available-p grammar)
      (treesit-install-language-grammar grammar))))

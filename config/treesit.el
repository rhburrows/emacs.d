(use-package emacs
  :init
  (setq treesit-language-source-alist
   '((rust . ("https://github.com/tree-sitter/tree-sitter-rust" "v0.23.2"))))

  :config
  (defun rhb/treesit-install-grammar (grammar)
    "Install Tree-sitter grammar if its absent."
    (interactive)
    (unless (treesit-language-available-p grammar)
      (treesit-install-language-grammar grammar))))

;; -*- lexical-binding: t; -*-
(use-package janet-ts-mode
  :straight (janet-ts-mode
             :type git
             :host github
             :repo "sogaiu/janet-ts-mode"
             :files ("*.el"))

  :init
  (add-to-list 'treesit-language-source-alist
               '(janet-simple
                 "https://github.com/sogaiu/tree-sitter-janet-simple"))
  (unless (treesit-language-available-p 'janet-simple)
    (treesit-install-language-grammar 'janet-simple)))

;; -*- lexical-binding: t; -*-

(use-package markdown-ts-mode
  :straight (:type built-in)

  :mode (("\\.md\\'" . markdown-ts-mode))

  :custom
  (markdown-command "pandoc -f markdown -t html -s --mathjax --highlight-style=pygments"))

(use-package markdown-ts-appear
  :straight (markdown-ts-appear
             :type git
             :host github
             :repo "Thysrael/markdown-ts-appear")

  :hook
  (markdown-ts-mode . markdown-ts-appear-mode))

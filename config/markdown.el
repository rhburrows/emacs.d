;; -*- lexical-binding: t; -*-

(use-package markdown-ts-mode
  :straight (:type built-in)

  :mode (("\\.md\\'" . markdown-ts-mode))

  :custom
  (markdown-command "pandoc -f markdown -t html -s --mathjax --highlight-style=pygments"))

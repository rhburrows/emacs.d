;;; -*- lexical-binding: t; -*-

(use-package neocaml
  :config
  (add-to-list 'eglot-server-programs
               '((neocaml-mode neocaml-interface-mode) . ("ocamllsp"))))

(use-package ocaml-eglot
  :hook
  (neocaml-base-mode . ocaml-eglot))

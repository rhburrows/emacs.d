(setq-default indent-tabs-mode nil)

(require 'whitespace)
(setq whitespace-line-column 80)
(setq whitespace-style '(face tabs empty trailing lines-tail))

(global-undo-tree-mode)
(editorconfig-mode 1)

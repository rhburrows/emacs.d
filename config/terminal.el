(use-package vterm
  :hook
  ((vterm-mode . (lambda () (display-line-numbers-mode 0)))))

(use-package vterm-toggle
  :after (vterm)
  :bind (
         ("C-c t" . vterm-toggle)
         ))

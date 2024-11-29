(use-package vterm
  :config
  (add-hook 'vterm-mode-hook (lambda () (display-line-numbers-mode 0))))

(use-package vterm-toggle
  :after (vterm)
  :bind (
         ("C-c t" . vterm-toggle)
         ))

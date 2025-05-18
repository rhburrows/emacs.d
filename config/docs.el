(use-package eldoc
  :init
  (global-eldoc-mode))

(use-package eldoc-box
  :after eldoc

  :bind
  (:map prog-mode-map ("M-RET" . eldoc-box-help-at-point)))

(use-package helpful
  :bind
  (("C-h f" . helpful-callable)
   ("C-h v" . helpful-variable)
   ("C-h k" . helpful-key)
   ("C-h x" . helpful-command)
   ("C-c C-d" . helpful-at-point)))

(use-package devdocs
  :bind (( "C-c d" . devdocs-lookup)))

(use-package go-mode
  :ensure t
  :init
  (defun lsp-go-install-save-hooks ()
    (add-hook 'before-save-hook #'lsp-format-buffer t t)
    (add-hook 'before-save-hook #'lsp-organize-imports t t))

  :config
  (add-hook 'go-mode-hook #'lsp-go-install-save-hooks))

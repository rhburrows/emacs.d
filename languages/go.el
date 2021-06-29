(use-package go-mode
  :ensure t
  :init
  (defun lsp-go-mode-hook ()
    (subword-mode +1))
  (defun lsp-go-install-save-hooks ()
    (add-hook 'before-save-hook #'lsp-format-buffer t t)
    (add-hook 'before-save-hook #'lsp-organize-imports t t))

  :hook (
         (go-mode . lsp-go-mode-hook)
         (go-mode . lsp-go-install-save-hooks))

  :config
  (use-package go-dlv
    :ensure t

    :init
    (defun rhb-dlv-go-mode-hook ()
      (progn
        (gud-def gud-break  "break %f:%l"    "\C-b" "Set breakpoint at current line.")
        (gud-def gud-trace  "trace %f:%l"    "\C-t" "Set trace at current line.")
        (gud-def gud-remove "clearall %f:%l" "\C-d" "Remove breakpoint at current line")))

    :hook (
           (go-dlv-mode . rhb-dlv-go-mode-hook))))

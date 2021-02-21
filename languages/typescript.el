(use-package typescript-mode
  :ensure t)

(use-package web-mode
  :ensure t
  :mode (("\\.tsx$" . web-mode))
  :init
  (defun lsp-web-mode-hook ()
    (flycheck-add-mode 'javascript-eslint 'web-mode)
    (flycheck-add-next-checker 'lsp 'javascript-eslint))

  :hook
  (web-mode . lsp-web-mode-hook))

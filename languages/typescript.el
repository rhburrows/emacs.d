(use-package typescript-mode
  :ensure t)

(use-package web-mode
  :ensure t
  :init
  (defun lsp-web-mode-hook ()
    (flycheck-add-mode 'javascript-eslint 'web-mode)
    (flycheck-add-next-checker 'lsp 'javascript-eslint))

  :hook
  (web-mode . lsp-web-mode-hook)
  
  :config
  (add-to-list 'auto-mode-alist '("\\.tsx$" . web-mode)))

(use-package typescript-mode
  :ensure t

  :config
  (add-to-list 'auto-mode-alist '("\\.tsx$" . typescript-mode)))

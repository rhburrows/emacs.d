(use-package typescript-mode
  :ensure t)

(use-package web-mode
  :ensure t

  :config
  (add-to-list 'auto-mode-alist '("\\.tsx$" . web-mode)))


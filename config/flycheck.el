(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  :custom
  (flymake-show-diagnostics-at-end-of-line 'fancy))

(use-package flycheck-eglot
  :ensure t
  :after (flycheck eglot)
  :custom
  (global-flycheck-mode t))

(use-package consult-flycheck
  :after (flycheck consult))

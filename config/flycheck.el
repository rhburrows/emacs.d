(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package flycheck-eglot
  :ensure t
  :after (flycheck eglot)
  :config
  (global-flycheck-eglot-mode 1))

(use-package flycheck-rust
  :hook
  (flycheck-mode . flycheck-rust-setup))

(use-package flycheck-status-emoji
  :after flycheck
  :config
  (flycheck-status-emoji-mode 1))

(use-package consult-flycheck
  :after (flycheck consult))

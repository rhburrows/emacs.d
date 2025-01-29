(use-package neon-mode
  :straight (neon-mode
             :type git
             :host github
             :repo "Fuco1/neon-mode")

  :hook (neon-mode . (lambda () (setq-local tab-width 4))))

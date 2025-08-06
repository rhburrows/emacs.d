(use-package gptel
  :defer t
  :config
  (setq
   gptel-default-mode 'org-mode
   gptel-model "mistral-small3.2:latest"
   gptel-backend (gptel-make-ollama "Ollama"
                   :host "localhost:11434"
                   :stream t
                   :models '("mistral-small3.2:latest"))))

(use-package web-server)

(use-package claude-code-ide
  :straight (:type git :host github :repo "manzaltu/claude-code-ide.el")
  :after web-server

  :bind ("C-c '" . claude-code-ide-menu)

  :config
  (claude-code-ide-emacs-tools-setup)

  :custom
  (claude-code-ide-terminal-backend 'eat))

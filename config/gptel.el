(use-package gptel
  :defer t
  :config
  (setq
   gptel-default-mode 'org-mode
   gptel-model "qwen2.5-coder:14b"
   gptel-backend (gptel-make-ollama "Ollama"
                   :host "localhost:11434"
                   :stream t
                   :models '("qwen2.5-coder:14b")))

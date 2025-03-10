(use-package gptel
  :defer t
  :config
  (setq
   gptel-default-mode 'org-mode
   gptel-model "qwen2.5-coder:14b"
   gptel-backend (gptel-make-ollama "Ollama"
                   :host "localhost:11434"
                   :stream t
                   :models '("qwen2.5-coder:14b"))))

(use-package aider
  :straight (:host github :repo "tninja/aider.el" :files ("aider.el"))
  :bind
  (( "C-c a" . aider-transient-menu))
  :custom
  (aider-args `("--config" ,(expand-file-name "~/.aider.conf.yml"))))

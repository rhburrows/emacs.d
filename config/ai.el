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

(use-package aidermacs
  :straight (:host github :repo "MatthewZMD/aidermacs")
  :bind
  (( "C-c a" . aidermacs-transient-menu))
  :custom
  (aidermacs-backend 'comint)
  (aidermacs-show-diff-after-change t)
  (aidermacs-default-model "sonnet"))

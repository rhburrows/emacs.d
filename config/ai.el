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

(use-package aidermacs
  :straight (:host github :repo "MatthewZMD/aidermacs")
  :bind
  (( "C-c a" . aidermacs-transient-menu))
  :custom
  (aidermacs-backend 'comint)
  (aidermacs-show-diff-after-change t)
  (aidermacs-default-model "sonnet"))

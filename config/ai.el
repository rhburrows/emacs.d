;; -*- lexical-binding: t; -*-

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

(use-package agent-shell
  :config
  (transient-define-prefix rhb/ai-transient ()
    "AI Transient menu"
    ["Actions"
     ("o" "Start OpenCode" agent-shell-opencode)
     ("c" "Start Claude Code" agent-shell-anthropic-start-claude-code)]
    ["Review"
     ("r" "Agent review" agent-review)])

  :bind
  ("C-c '" . rhb/ai-transient))

(use-package agent-review
  :commands (agent-review)
  :straight (agent-review
             :type git
             :host github
             :repo "nineluj/agent-review"
             :files ("*.el")))


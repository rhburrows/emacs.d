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
  :commands (agent-shell-anthropic-start-claude-code
             agent-shell-opencode-start-agent))

(use-package agent-review
  :commands (agent-review)
  :straight (agent-review
             :type git
             :host github
             :repo "nineluj/agent-review"
             :files ("*.el")))

(transient-define-prefix rhb/ai-transient ()
  "AI Transient menu"
  ["Commands"
   ("c" "Claude Code" agent-shell-anthropic-start-claude-code)
   ("o" "Opencode" agent-shell-opencode-start-agent)
   ("r" "Agent review" agent-review)])
(global-set-key (kbd "C-c '") 'rhb/ai-transient)

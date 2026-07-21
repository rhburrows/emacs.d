;; -*- lexical-binding: t; -*-

(use-package gptel
  :defer t
  :config
  (setq
   gptel-default-mode 'org-mode))

(use-package agent-shell
  :config
  (transient-define-prefix rhb/ai-transient ()
    "AI Transient menu"
    ["Agents"
     ("o" "Start OpenCode" agent-shell-opencode-start-agent)
     ("c" "Start Claude Code" agent-shell-anthropic-start-claude-code)]
    ["Send"
     ("r" "Send region or error" agent-shell-send-dwim)
     ("f" "Send file" agent-shell-send-file)]
    ["Review"
     ("R" "Agent review" agent-review)])

  :hook
  (agent-shell-mode-hook . (lambda () (display-line-numbers-mode -1)))
  
  :bind
  ("C-c '" . rhb/ai-transient))

(use-package agent-review
  :commands (agent-review)
  :straight (agent-review
             :type git
             :host github
             :repo "nineluj/agent-review"
             :files ("*.el")))


;; -*- lexical-binding: t; -*-

(use-package agent-shell
  :custom
  (agent-shell-prefer-viewport-interaction t)
  (agent-shell-pi-environment '("PI_ACP_ENABLE_EMBEDDED_CONTEXT=true"))
  ;; Trim down the list of suggested agents to just ones I might use
  (agent-shell-agent-configs '(
                               agent-shell-anthropic-make-claude-code-config
                               agent-shell-openai-make-codex-config
                               agent-shell-pi-make-agent-config
                               agent-shell-opencode-make-agent-config))

  (agent-shell-anthropic-default-session-mode-id "auto")

  :hook
  (agent-shell-mode-hook . (lambda () (display-line-numbers-mode -1)))

  :bind
  ("C-c '" . agent-shell))

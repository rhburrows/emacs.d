;; -*- lexical-binding: t; -*-

(use-package gptel
  :defer t
  :config
  (setq
   gptel-default-mode 'org-mode))

(use-package agent-shell
  :config
  (defconst rhb/ai-transient-agent-specs
    '((:agent "OpenCode"
              :key "o"
              :description "Start OpenCode"
              :command-variable agent-shell-opencode-acp-command
              :function agent-shell-opencode-start-agent)
      (:agent "Claude Code"
              :key "c"
              :description "Start Claude Code"
              :command-variable agent-shell-anthropic-claude-acp-command
              :function agent-shell-anthropic-start-claude-code)
      (:agent "Codex"
              :key "x"
              :description "Start Codex"
              :command-variable agent-shell-openai-codex-acp-command
              :function agent-shell-openai-start-codex)
      (:agent "Goose"
              :key "g"
              :description "Start Goose"
              :command-variable agent-shell-goose-acp-command
              :function agent-shell-goose-start-agent)
      (:agent "Pi"
              :key "p"
              :description "Start Pi"
              :command-variable agent-shell-pi-acp-command
              :function agent-shell-pi-start-agent))
    "Agent Shell agents shown in `rhb/ai-transient'.")

  (defvar rhb/ai-transient--agent-suffixes nil
    "Available Agent Shell suffix specifications.")

  (defun rhb/ai-transient--agent-binary (spec)
    "Return the executable configured for agent SPEC."
    (when-let* ((command-variable (plist-get spec :command-variable))
                ((boundp command-variable))
                (command (symbol-value command-variable)))
      (car command)))

  (defun rhb/ai-transient-refresh ()
    "Refresh the Agent Shell entries in `rhb/ai-transient'."
    (interactive)
    (setq rhb/ai-transient--agent-suffixes nil)
    (dolist (spec rhb/ai-transient-agent-specs)
      (let ((binary (rhb/ai-transient--agent-binary spec)))
        (if (and binary (executable-find binary))
            (push (list (plist-get spec :key)
                        (plist-get spec :description)
                        (plist-get spec :function))
                  rhb/ai-transient--agent-suffixes)
          (message "Agent Shell: couldn't find binary %s; omitting %s from the menu"
                   (or binary (plist-get spec :command-variable))
                   (plist-get spec :agent)))))
    (setq rhb/ai-transient--agent-suffixes
          (nreverse rhb/ai-transient--agent-suffixes))
    (when (called-interactively-p 'interactive)
      (message "Agent Shell menu refreshed (%d agent%s available)"
               (length rhb/ai-transient--agent-suffixes)
               (if (= (length rhb/ai-transient--agent-suffixes) 1) "" "s"))))

  (transient-define-prefix rhb/ai-transient ()
    "AI Transient menu"
    ["Agents"
     :if (lambda () rhb/ai-transient--agent-suffixes)
     :class transient-column
     :setup-children
     (lambda (_)
       (transient-parse-suffixes
        'rhb/ai-transient rhb/ai-transient--agent-suffixes))]
    ["Send"
     ("r" "Send region or error" agent-shell-send-dwim)
     ("f" "Send file" agent-shell-send-file)])

  (rhb/ai-transient-refresh)

  :hook
  (agent-shell-mode-hook . (lambda () (display-line-numbers-mode -1)))

  :bind
  ("C-c '" . rhb/ai-transient))

(use-package agent-shell-macext
  :straight (agent-shell-macext
             :type git
             :host github
             :repo "cxa/agent-shell-macext")
  :after agent-shell
  :custom
  (agent-shell-macext-file-copy-policy 'auto)
  (agent-shell-macext-notifications t)
  (agent-shell-macext-notify-current-buffer nil))

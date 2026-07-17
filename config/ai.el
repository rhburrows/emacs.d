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
  (defcustom rhb/ai-implement-prompt
    "Implement the body of this function. Use the function signature and name to infer intent replace the function signature with the complete implementation in place. Do not edit any code aside from this function. "
    "prompt for implementing a function"
    :type 'string)

  (defun rhb/ai--config ()
    "Return agent config based on transient state."
    (interactive)
    (let ((values (when (bound-and-true-p transient--prefix)
                    (transient-get-value))))
      (if (alist-get "--claude" values nil nil #'equal)
          (agent-shell-anthropic-make-claude-code-config)
        (agent-shell-opencode-make-agent-config))))

  (defun rhb/ai-start-shell ()
    "Start a new agent shell using transient options."
    (interactive)
    (let* ((config (rhb/ai--config))
           (shell-buffer (agent-shell--dwim :config config :new-shell t)))
      (when-let ((prompt (rhb/ai--prompt)))
        (agent-shell-insert :text prompt :shell-buffer shell-buffer))))

  (defun rhb/ai-implement ()
    "Implement the body of the surrounding function signature."
    (interactive)
    ;; TODO: verify buffer is saved & lock it until edit is done
    (let* ((config (rhb/ai--config))
           (context (if (region-active-p)
                        (agent-shell--get-region-context :deactivate t)
                      (agent-shell--get-current-line-context)))
           (text (concat rhb/ai-implement-prompt "\n\n" context))
           (shell-buffer (agent-shell--start :config config
                                             :new-session t
                                             :session-strategy 'new
                                             :no-focus t)))
      (agent-shell--display-buffer shell-buffer)
      (agent-shell-insert :text text :shell-buffer shell-buffer)
      (agent-shell-submit))) ;; TODO: reload buffer on finish

  (transient-define-prefix rhb/ai-transient ()
    "AI Transient menu"
    ["Options"
     ("-c" "Use Claude" "--claude")]
    ["Actions"
     ("s" "Start shell" rhb/ai-start-shell)
     ("i" "Implement function" rhb/ai-implement)]
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


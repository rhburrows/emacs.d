;; -*- lexical-binding: t; -*-

(use-package ibuffer
  :config
  (define-ibuffer-column icon
    (:name "" :inline t)
    (cond
     ((buffer-file-name)
      (nerd-icons-icon-for-buffer))
     (major-mode (nerd-icons-icon-for-mode major-mode))
     (t "")))

  (define-ibuffer-column agent-status
    (:name "Status")
    (if (and (derived-mode-p 'agent-shell-mode)
             (fboundp 'agent-shell-status))
        (pcase (agent-shell-status)
          ('busy (propertize "● busy" 'face 'warning))
          ('blocked (propertize "● blocked" 'face 'error))
          ('ready (propertize "● ready" 'face 'success))
          (_ ""))
      ""))

  (define-ibuffer-column agent-name
    (:name "Agent")
    (if (and (derived-mode-p 'agent-shell-mode)
             (boundp 'agent-shell--state))
        (or (map-nested-elt agent-shell--state '(:agent-config :mode-line-name))
            (map-nested-elt agent-shell--state '(:agent-config :buffer-name))
            "")
      ""))

  (define-ibuffer-column agent-model
    (:name "Model")
    (if (and (derived-mode-p 'agent-shell-mode)
             (boundp 'agent-shell--state)
             (fboundp 'agent-shell-get-model-name))
        (or (agent-shell-get-model-name agent-shell--state) "")
      ""))

  (define-ibuffer-column agent-mode
    (:name "Mode")
    (if (and (derived-mode-p 'agent-shell-mode)
             (boundp 'agent-shell--state)
             (fboundp 'agent-shell-get-mode-name))
        (or (agent-shell-get-mode-name agent-shell--state) "")
      ""))

  (define-ibuffer-column agent-project
    (:name "Project")
    (if (and (derived-mode-p 'agent-shell-mode)
             (fboundp 'agent-shell--project-name)
             (project-current))
        (agent-shell--project-name)
      ""))

  (defun rhb/ibuffer-agents ()
    "Open a dedicated ibuffer showing only agent-shell sessions.

Uses its own buffer, format, and no filter groups, independent of the
default `ibuffer'.  Enables `ibuffer-auto-mode' so the list tracks
agent shells as they come and go."
    (interactive)
    (ibuffer t "*Ibuffer Agents*"
             '((mode . agent-shell-mode))
             nil nil nil
             '((" "
                (agent-status 10 10 :left)
                " "
                (agent-name 12 12 :left :elide)
                " "
                (agent-project 30 30 :left :elide)
                " "
                (agent-mode 12 12 :left :elide)
                " "
                (agent-model 12 12 :left :elide)
                " "
                (name 40 30 :left :elide))))
    (with-current-buffer "*Ibuffer Agents*"
      (setq ibuffer-filter-groups nil)
      (ibuffer-auto-mode 1)
      (ibuffer-update nil t)))

  :bind (:map global-map
              ("C-c a" . rhb/ibuffer-agents)
              ("C-x C-b" . ibuffer))

  :hook
  (ibuffer-mode . hl-line-mode)
  (ibuffer-mode . (lambda ()
                    (display-line-numbers-mode -1)
                    (local-unset-key (kbd "M-o"))))

  :custom
  (ibuffer-expert t)
  (ibuffer-display-summary nil)
  (ibuffer-human-readable-size t)
  (ibuffer-default-shrink-to-minimum-size nil)
  (ibuffer-show-empty-filter-groups nil)
  (ibuffer-formats
   '((mark modified read-only locked " "
           (icon 2 2)
           (name 30 30 :left :elide)
           " "
           (size 9 -1 :right)
           " "
           (mode 16 16 :left :elide)
           " " project-file-relative)))
  (ibuffer-fontification-alist
   '((10 buffer-read-only font-lock-constant-face)
     (15 (and buffer-file-name
	            (string-match ibuffer-compressed-file-name-regexp
			                      buffer-file-name))
	       font-lock-doc-face)
     (20 (or
          (string-match "^\\*" (buffer-name))
          (memq major-mode ibuffer-help-buffer-modes)) font-lock-comment-face)
     (25 (ibuffer-hidden-buffer-p) italic)
     (35 (derived-mode-p 'dired-mode) font-lock-function-name-face)
     (40 (derived-mode-p 'ghostel-mode 'eshell-mode) font-lock-type-face)
     (50 (or
          (derived-mode-p 'agent-shell-mode 'agent-review-mode)
          (string-match "^\\*claude-code" (buffer-name)))
         font-lock-string-face)
     (50 (and (boundp 'emacs-lock-mode) emacs-lock-mode) ibuffer-locked-buffer))))

(use-package ibuffer-project
  :hook (ibuffer . (lambda ()
                     (unless (equal (buffer-name) "*Ibuffer Agents*")
                       (setq ibuffer-filter-groups (ibuffer-project-generate-filter-groups))
                       (ibuffer-update nil t))))

  :custom
  (ibuffer-default-sorting-mode 'project-file-relative))

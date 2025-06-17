(use-package eshell
  :config
  ;; Originally based on https://lambdaland.org/posts/2024-08-19_fancy_eshell_prompt/
  (defun rhb/eshell-prompt ()
    "A pretty shell prompt with git status"
    (let* ((cwd (abbreviate-file-name (eshell/pwd)))
           (ref (magit-get-shortname "HEAD"))
           (stat (magit-file-status))
           (x-stat eshell-last-command-status)
           (git-chunk
            (if ref
                (format "%s%s%s "
                        (propertize (if stat "[" "(") 'font-lock-face (list :foreground (if stat "red" "green")))
                        (propertize ref 'font-lock-face '(:foreground "#aaaa00"))
                        (propertize (if stat "]" ")") 'font-lock-face (list :foreground (if stat "red" "green"))))
              "")))
      (propertize
       (format "%s %s %s$ "
               (if (< 0 x-stat) (format (propertize "!%s" 'font-lock-face '(:foreground "red")) x-stat)
                 (propertize "➤" 'font-lock-face (list :foreground (if (< 0 x-stat) "red" "green"))))
               (propertize cwd 'font-lock-face '(:foreground "#45babf"))
               git-chunk)
       'front-sticky   '(font-lock-face read-only)
       'rear-nonsticky '(font-lock-face read-only))))

  ;; For some reason I can't get setting this value to work via the `:custom` section below'
  (setopt eshell-visual-commands '("top" "htop" "less" "more"
                                   "opctl"))

  :bind (
         ("C-c e" . eshell)
         )

  :hook
  (eshell-mode . (lambda ()
                   (setq-local imenu-generic-expression
                               '(("Prompt" " $ \\(.*\\)" 1)))))

  :custom
  (eshell-highlight-prompt nil)
  (eshell-prompt-regexp "^[^#$\n]* [$#] ")
  (eshell-prompt-function 'rhb/eshell-prompt)

  (eshell-visual-options '(("git" "--help" "--paginate")))
  (eshell-visual-subcommands '(("git" "log" "diff" "show"))))

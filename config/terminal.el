(use-package eat
  :straight (:files ("*.el" ("term" "term/*.el") "*.texi"
                     "*.ti" ("terminfo/e" "terminfo/e/*")
                     ("terminfo/65" "terminfo/65/*")
                     ("integration" "integration/*")
                     (:exclude ".dir-locals.el" "*-tests.el")))

  :custom
  (read-process-output-max (* 2 1024 1024))
  (process-adaptive-read-buffering nil)
  (eat-kill-buffer-on-exit t))

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


  :bind (("C-c e" . eshell))

  :custom
  (eshell-highlight-prompt nil)
  (eshell-prompt-regexp "^[^#$\n]* [$#] ")
  (eshell-prompt-function 'rhb/eshell-prompt)

  :hook
  (eshell-load . eat-eshell-mode)
  (eshell-mode . (lambda ()
                   (setq-local imenu-generic-expression
                               '(("Prompt" " $ \\(.*\\)" 1))))))

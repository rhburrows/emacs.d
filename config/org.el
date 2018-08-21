
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(setq org-ellipsis "⤵")

(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)
(global-set-key (kbd "C-c b") #'org-switchb)

(setq org-M-RET-may-split-line nil)

(setq org-agenda-files
      (list "~/Dropbox/org/tasks.org"))

(setq org-capture-templates
      '(("t" "Task" entry (file "~/Dropbox/org/inbox.org")
         "* TODO %?" :prepend t)
        ("n" "Note" entry (file+headline "~/Dropbox/org/notes.org" "Misc Notes")
         "** %?" :prepend t)
        ))

;; Make sure we can refile tasks from the "Inbox" to projects
(setq org-refile-targets '(("tasks.org" :level . 2)))

;; org-journal setup
(setq org-journal-dir "~/Dropbox/org/journal")
(setq org-journal-file-format "%Y-%m-%d")
(add-hook 'org-journal-mode-hook (lambda () (auto-fill-mode 1)))

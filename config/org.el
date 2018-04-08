
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(setq org-ellipsis "⤵")

(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)
(global-set-key (kbd "C-c b") #'org-iswitchb)

(setq org-M-RET-may-split-line nil)

(setq org-default-notes-file "~/Dropbox/org/tasks.org")
(setq org-agenda-files
      (list
       "~/Dropbox/org/tasks.org"
       "~/Dropbox/org/notes.org"))

(setq org-capture-templates
      '(("t" "Task" entry (file+headline "~/Dropbox/org/tasks.org" "Inbox")
         "* TODO %?" :prepend t)))

;; Make sure we can refile tasks from the "Inbox" to projects
(setq org-refile-targets '(("tasks.org" :level . 2)))

(setq org-ellipsis "⤵")

(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)
(global-set-key (kbd "C-c b") #'org-switchb)

(setq org-M-RET-may-split-line nil)

(setq org-agenda-files
      (list
;       "~/Dropbox/org/inbox.org"
       "~/Dropbox/org/personal.org"
       "~/Dropbox/org/projects.org"
       "~/Dropbox/org/work.org"))

(setq org-capture-templates
      '(("t" "Task" entry (file "~/Dropbox/org/inbox.org")
         "* TODO %?" :prepend t)
        ("n" "Note" entry (file+headline "~/Dropbox/org/notes.org" "Misc Notes")
         "** %?" :prepend t)
        ))

;; Make sure we can refile tasks from the "Inbox" to projects
(setq org-refile-targets '(
                           ("personal.org" :level . 1)
                           ("projects.org" :level . 1)
                           ("work.org" :level . 2)))

;; org-journal setup
(setq org-journal-dir "~/Dropbox/org/journal")
(setq org-journal-file-format "%Y-%m-%d")
(add-hook 'org-journal-mode-hook (lambda () (auto-fill-mode 1)))

;; Jump to jira task for org-mode subtree
(defun rhb-jump-to-jira-task ()
  (interactive)
  (let ((host (org-entry-get-with-inheritance "JIRA_HOST"))
        (ticket (org-entry-get nil "JIRA_TICKET")))
    (browse-url (concat host "/browse/" ticket))))

(add-hook 'org-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c C-x j") 'rhb-jump-to-jira-task)
            (org-bullets-mode 1)))

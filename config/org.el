(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c c") #'org-capture)
(global-set-key (kbd "C-c b") #'org-switchb)

(setq org-M-RET-may-split-line nil)

(setq org-capture-templates
      '(("n" "Note" entry (file+headline "~/Dropbox/org/notes.org" "Misc Notes")
         "* %?" :prepend t)
        ))

;; org-journal setup
(setq org-journal-dir "~/Dropbox/org/journal")
(setq org-journal-file-format "%Y-%m-%d")
(add-hook 'org-journal-mode-hook (lambda () (auto-fill-mode 1)))

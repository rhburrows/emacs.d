(use-package obsidian
  :custom
  (obsidian-inbox-directory "Inbox")
  (obsidian-daily-notes-directory "Inbox")
  (obsidian-templates-directory "Templates")
  (obsidian-daily-note-template "Daily Note.md")
  
  :config
  (global-set-key (kbd "C-x !") 'obsidian-daily-note)
  (obsidian-specify-path "~/Documents/Notes")
  (global-obsidian-mode t))

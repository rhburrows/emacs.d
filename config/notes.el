(use-package obsidian
  ;; https://github.com/licht1stein/obsidian.el/pull/100
  ;; Temporarily use jayemar's branch until this PR gets merged
  ;; I was running into a crash when `tags:` in the front matter was empty
  ;; this branch fixes it as well as speeding things up
  :straight (obsidian
             :type git
             :host github
             :repo "jayemar/obsidian.el"
             :branch "jayemar/hashtable-for-files-cache")

  :custom
  (obsidian-directory "~/Documents/Notes")
  (obsidian-inbox-directory "Inbox")
  (obsidian-daily-notes-directory "Inbox")
  (obsidian-templates-directory "Templates")
  (obsidian-daily-note-template "Daily Note.md")

  :bind (
         ("C-c !" . obsidian-daily-note)

         :map obsidian-mode-map
         ("C-c C-o" . obsidian-follow-link-at-point)
         ("C-c C-b" . obsidian-backlink-jump)
         ("C-c C-l" . obsidian-insert-link)
         ("C-c C-f" . obsidian-jump)
         ("C-c C-s" . obsidian-search)
         )
  
  :config
  (global-obsidian-mode t))

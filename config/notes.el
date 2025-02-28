(use-package obsidian
  ;; Switching to master branch until a new version gets released including the following
  ;; https://github.com/licht1stein/obsidian.el/pull/100
  :straight (obsidian
             :type git
             :host github
             :repo "licht1stein/obsidian.el"
             :branch "master")

  :custom
  (obsidian-directory "~/Documents/Notes")
  (obsidian-inbox-directory "Inbox")
  (obsidian-daily-notes-directory "Inbox")
  (obsidian-templates-directory "Templates")
  (obsidian-daily-note-template "Daily Note.md")

  :bind (
         ("C-c !" . obsidian-daily-note)
         ("C-c c" . obsidian-capture)

         :map obsidian-mode-map
         ("C-c C-o" . obsidian-follow-link-at-point)
         ("C-c C-b" . obsidian-backlink-jump)
         ("C-c C-l" . obsidian-insert-link)
         ("C-c C-f" . obsidian-jump)
         ("C-c C-s" . obsidian-search)
         )
  
  :config
  (global-obsidian-mode t))

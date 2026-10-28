;; -*- lexical-binding: t; -*-

(use-package obsidian
  :custom
  (obsidian-directory "~/Documents/Notes")
  (obsidian-inbox-directory "1. Inbox")
  (obsidian-daily-notes-directory "Daily Notes")
  (obsidian-templates-directory "Templates")
  (obsidian-daily-note-template "Daily Notes Template.md")

  :bind (
         ("C-c n d" . obsidian-daily-note)
         ("C-c n c" . obsidian-capture)

         :map obsidian-mode-map
         ("C-c C-o" . obsidian-follow-link-at-point)
         ("C-c C-b" . obsidian-backlink-jump)
         ("C-c C-l" . obsidian-insert-link)
         ("C-c C-f" . obsidian-jump)
         ("C-c C-s" . obsidian-search)
         )

  :config
  (defun obsidian-capture ()
    "Create an Obsidian inbox note with an editable timestamp prefix."
    (interactive)
    (let* ((title (read-from-minibuffer
                   "Title: " (format-time-string "%Y-%m-%d %H%M ")))
           (filename (s-concat obsidian-directory "/" obsidian-inbox-directory "/" title ".md"))
           (clean-filename (s-replace "//" "/" filename)))
      (find-file (expand-file-name clean-filename) t)
      (save-buffer)))

  (global-obsidian-mode t))

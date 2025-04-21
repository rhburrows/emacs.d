(use-package org
  :config
  (define-key org-mode-map (kbd "C-c C-r") verb-command-map)

  :custom
  (org-startup-truncated nil)
  (org-startup-indented t)
  (org-startup-with-inline-images t)
  (org-startup-folded 'content)
  (org-image-actual-width '(300))
  (org-pretty-entities t)
  (org-ellipsis " ⤵")
  (org-hide-emphasis-markers t)
  (org-use-sub-superscripts "{}")
  (org-blank-before-new-entry '(heading . nil) (plain-list-item . nil)))

(use-package org-bullets
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "►" "•")))

(use-package org-appear
  :hook (org-mode . org-appear-mode)
  :custom
  (org-appear-autosubmarkers t))

(use-package org-tidy
  :hook (org-mode . org-tidy-mode)
  :custom
  (org-tidy-properties-style 'fringe))

(use-package org-roam
  :config
  (org-roam-db-autosync-mode)

  :bind (
         ("C-c c" . org-roam-dailies-capture-today)
         ("C-c !" . org-roam-dailies-goto-today)

         ("C-c n c" . org-roam-capture)
         ("C-c n f" . org-roam-node-find)
         ("C-c n l" . org-roam-buffer-toggle)
         )

  :custom
  (org-roam-directory (expand-file-name "~/Notes"))
  (org-roam-db-location (file-name-concat user-init-dir ".org-roam.db"))
  (org-roam-dailies-directory "fleeting/")

  (org-roam-capture-templates '(
                                ("n" "note" plain "%?"
                                 :target (file+head "zk/%<%Y%m%d%H%M%S>-${slug}.org"
                                                    "#+title: ${title}\n")
                                 :unnarrowed t)
                                ("p" "project" plan "%?"
                                 :target (file+head "projects/${slug}.org"
                                                    "#+title: ${title}\n")
                                 :unnarrowed t))))

(use-package org-remark
  :after org
  :bind (
         ("C-c n m" . org-remark-mark)
         ("C-c n l" . org-remark-mark-line)
         :map org-remark-mode-map
         ("C-c n o" . org-remark-open)
         ("C-c n ]" . org-remark-view-next)
         ("C-c n [" . org-remark-view-prev)
         ("C-c n r" . org-remark-remove)
         ("C-c n d" . org-remark-delete))
  :init
  (org-remark-global-tracking-mode +1)
  :custom
  (org-remark-notes-file-name "~/Notes/remarks.org"))

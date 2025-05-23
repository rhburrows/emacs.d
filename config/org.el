(use-package org
  :custom
  (org-startup-truncated nil)
  (org-startup-indented t)
  (org-startup-with-inline-images t)
  (org-image-actual-width '(300))
  (org-pretty-entities t)
  (org-ellipsis " ⤵")
  (org-hide-emphasis-markers t)
  (org-use-sub-superscripts "{}")
  (org-blank-before-new-entry '(heading . nil) (plain-list-item . nil))

  :config
  (define-key org-mode-map (kbd "C-c C-r") verb-command-map)
  (setf (cdr (assoc 'file org-link-frame-setup)) 'find-file)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '(
     (emacs-lisp . t)
     (dot . t)
     ))

  (org-link-set-parameters
   "x-devonthink-item"
   :follow (lambda (url arg) (browse-url (concat "x-devonthink-item:" url) arg)))

  :hook (org-mode . turn-on-auto-fill))

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

(defvar rhb/notes-directory (expand-file-name "~/Notes"))

(use-package org-roam
  :config
  (org-roam-db-autosync-mode)
  (let ((template-file (file-name-concat rhb/notes-directory "templates/capture.el")))
    (if (f-exists? template-file)
        (load-file template-file)))

  :bind (
         ("C-c n c" . org-roam-capture)
         ("C-c n f" . org-roam-node-find)
         :map org-mode-map
         ("C-c n l" . org-roam-buffer-toggle)
         ("C-c n i" . org-roam-node-insert))

  :custom
  (org-roam-directory rhb/notes-directory)
  (org-roam-db-location (file-name-concat user-init-dir ".org-roam.db")))

(use-package org-roam-ui
  :after org-roam
  :config
  (org-roam-ui-sync-theme t)
  (org-roam-ui-follow t)
  (org-roam-ui-update-on-save t))

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
  (org-remark-notes-file-name (file-name-concat rhb/notes-directory "remarks.org")))

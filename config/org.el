(use-package org
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
  (org-blank-before-new-entry '(heading . nil) (plain-list-item . nil))

  (org-babel-load-languages )

  :config
  (define-key org-mode-map (kbd "C-c C-r") verb-command-map)
  (setf (cdr (assoc 'file org-link-frame-setup)) 'find-file)
  ;; org-babel-load-languages is set in :custom above
  (org-babel-do-load-languages
   'org-babel-load-languages
   '(
     (emacs-lisp . t)
     (dot . t)
     ))

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

(use-package bibtex
  :init
  (defun rhb/capture-new-bib-reference ()
    (interactive)
    (let ((bibliography (file-name-concat rhb/notes-directory "references.bib")))
      (find-file bibliography)
      (call-interactively 'bibtex-entry)))

  :custom
  (bibtex-dialect 'biblatex)
  (bibtex-user-optional-fields
   '(("keywords" "Keywords to describe the entry" "")
     ("file" "Link to a document file." "" )))
  (bibtex-align-at-equal-sign t)

  :bind ("C-c n b" . rhb/capture-new-bib-reference))

(use-package citar
  :demand t

  :hook
  (org-mode . citar-capf-setup)

  :custom
  (org-cite-global-bibliography (list (file-name-concat rhb/notes-directory "references.bib")))
  (org-cite-insert-processor 'citar)
  (org-cite-follow-processor 'citar)
  (org-cite-activate-processor 'citar)
  (citar-bibliography org-cite-global-bibliography)
  (citar-at-point-function 'embark-act))

(use-package citar-embark
  :after (citar embark)
  :config
  (citar-embark-mode))

(use-package citar-org-roam
  :after (citar org-roam)
  :config
  (citar-org-roam-mode))

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

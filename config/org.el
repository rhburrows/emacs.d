(use-package org
  :config
  (define-key org-mode-map (kbd "C-c C-r") verb-command-map)
  :custom
  (org-startup-truncated nil))

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
  (org-remark-notes-file-name "~/.remarks.org"))

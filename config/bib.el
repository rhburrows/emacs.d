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
  (bibtex-autokey-year-title-separator "_")
  (bibtex-align-at-equal-sign t)

  :bind ("C-c n b" . rhb/capture-new-bib-reference))

(defun rhb/get-bibliography-paths ()
  "Return a list of bibliography paths.
Always includes rhb/notes-directory/references.bib and any .bib files in
rhb/notes-directory/refs/ if that directory exists."
  (let* ((main-bib (file-name-concat rhb/notes-directory "references.bib"))
         (refs-dir (file-name-concat rhb/notes-directory "refs"))
         (bib-paths (list main-bib)))
    ;; Add .bib files from refs directory if it exists
    (when (file-directory-p refs-dir)
      (dolist (file (directory-files refs-dir t "\\.bib$"))
        (push file bib-paths)))
    ;; Return the collected paths
    (nreverse bib-paths)))

(use-package citar
  :demand t
  :hook
  (org-mode . citar-capf-setup)

  :init
  (defvar citar-indicator-files-icons
    (citar-indicator-create
     :symbol (nerd-icons-faicon
              "nf-fa-file_o"
              :face 'nerd-icons-green
              :v-adjust -0.1)
     :function #'citar-has-files
     :padding "  " ; need this because the default padding is too low for these icons
     :tag "has:files"))

  (defvar citar-indicator-links-icons
    (citar-indicator-create
     :symbol (nerd-icons-faicon
              "nf-fa-link"
              :face 'nerd-icons-orange
              :v-adjust 0.01)
     :function #'citar-has-links
     :padding "  "
     :tag "has:links"))

  (defvar citar-indicator-notes-icons
    (citar-indicator-create
     :symbol (nerd-icons-codicon
              "nf-cod-note"
              :face 'nerd-icons-blue
              :v-adjust -0.3)
     :function #'citar-has-notes
     :padding "    "
     :tag "has:notes"))

  (defvar citar-indicator-cited-icons
    (citar-indicator-create
     :symbol (nerd-icons-faicon
              "nf-fa-circle_o"
              :face 'nerd-icons-green)
     :function #'citar-is-cited
     :padding "  "
     :tag "is:cited"))

  :custom
  (org-cite-global-bibliography (rhb/get-bibliography-paths))
  (org-cite-insert-processor 'citar)
  (org-cite-follow-processor 'citar)
  (org-cite-activate-processor 'citar)
  (citar-bibliography org-cite-global-bibliography)
  (citar-at-point-function 'embark-act)

  :config
  (setq citar-indicators (list
                          citar-indicator-files-icons
                          citar-indicator-links-icons
                          citar-indicator-notes-icons
                          citar-indicator-cited-icons
                          )))

(use-package citar-embark
  :after (citar embark)
  :config
  (citar-embark-mode))

(use-package citar-org-roam
  :demand t
  :after (citar org-roam)
  :config
  (citar-org-roam-mode))

(use-package biblio)

(use-package biblio-openlibrary
  :after biblio
  :straight (biblio-openlibrary
             :type git
             :host github
             :repo "fabcontigiani/biblio-openlibrary"))

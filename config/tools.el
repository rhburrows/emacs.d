;; These packages are more specialized tools and not packages that
;; are assumed to be present throughout the configuration
(use-package ace-window
  :ensure t
  :bind
  ("M-o" . ace-window))

(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode))

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

(use-package whitespace
  :ensure t
  :config
  (setq whitespace-line-column 80)
  (setq whitespace-style '(face tabs empty trailing lines-tail)))

;; Configure ag if its available on the system
(use-package ag
  :if (executable-find "ag")
  :ensure t
  :bind
  ("C-c a" . counsel-ag))

(use-package pdf-tools
  :config
  (pdf-tools-install))

(use-package json-reformat
  :ensure t)

(use-package restclient
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.http$" . restclient-mode))

  (use-package company-restclient
    :ensure t
    :config
    (add-to-list 'company-backends 'company-restclient)))

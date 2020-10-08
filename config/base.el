(require 'package)

; Add melpa to the package sources
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

;; Set up notification system for mac
(if (string-equal system-type "darwin")
    (setq alert-default-style 'osx-notifier))

(defadvice split-window-right (after rebalance-windows activate)
  (balance-windows))

(defadvice split-window-below (after rebalance-windows activate)
  (balance-windows))

(defadvice delete-window (after rebalance-windows activate)
  (balance-windows))

(setq-default indent-tabs-mode nil)
(setq make-backup-files nil)
(setq auto-save-default nil)

(use-package ivy
  :ensure t
  :bind
  ("C-c C-r" . ivy-resume)
  ("C-x C-b" . ivy-switch-buffer)
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  (setq ivy-height 10))

(use-package swiper
  :ensure t
  :bind
  ("C-s" . swiper-isearch))

(use-package counsel
  :ensure t
  :bind
  ("M-x" . counsel-M-x)
  ("C-x C-f" . counsel-find-file)
  ("M-y" . counsel-yank-pop)
  ("C-c s" . counsel-rg))

(use-package magit
  :ensure t
  :bind
  ("C-x g" . magit-status)
  ("C-x M-g" . magit-dispatch-popup)
  :config
  (global-magit-file-mode 1)
  (setq magit-diff-refine-hunk 'all))

(use-package company
  :ensure t
  :config
  (global-company-mode))

(use-package flycheck
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-flycheck-mode))

(use-package treemacs
  :ensure t
  :bind
  ("C-c 0" . treemacs-select-window)

  :config
  (use-package treemacs-magit
    :ensure t
    :after treemacs magit))

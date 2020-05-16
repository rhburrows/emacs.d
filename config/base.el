;; Set up notification system for mac
(if (string-equal system-type "darwin")
    (setq alert-default-style 'osx-notifier))

(defun swap-windows ()
  "If you have 2 windows, it swaps them."
  (interactive)
  (cond ((/= (count-windows) 2)
         (message "You need exactly 2 windows to do this."))
        (t
         (let* ((w1 (car (window-list)))
                (w2 (cadr (window-list)))
                (b1 (window-buffer w1))
                (b2 (window-buffer w2))
                (s1 (window-start w1))
                (s2 (window-start w2)))
           (set-window-buffer w1 b2)
           (set-window-buffer w2 b1)
           (set-window-start w1 s2)
           (set-window-start w2 s1))))
  (other-window 1))

(defadvice split-window-right (after rebalance-windows activate)
  (balance-windows))

(defadvice split-window-below (after rebalance-windows activate)
  (balance-windows))

(defadvice delete-window (after rebalance-windows activate)
  (balance-windows))

(global-set-key (kbd "C-c s") 'swap-windows)

(setq-default indent-tabs-mode nil)

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
  ("M-y" . counsel-yank-pop))

;; Configure ag if its available on the system
(use-package ag
  :if (executable-find "ag")
  :ensure t
  :bind
  ("C-c a" . counsel-ag))

(use-package magit
  :ensure t
  :bind
  ("C-x g" . magit-status)
  ("C-x M-g" . magit-dispatch-popup)
  :config
  (global-magit-file-mode 1)
  (setq magit-diff-refine-hunk 'all))

(use-package ace-window
  :ensure t
  :bind
  ("M-o" . ace-window))

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

;; (require 'ansi-color)
;; (defun colorize-compilation-buffer ()
;;   (read-only-mode nil)
;;   (ansi-color-apply-on-region compilation-filter-start (point))
;;   (read-only-mode))
;; (add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

;; Setup terminal keybindins
;; (add-hook 'term-mode-hook
;;   (lambda () 
;;     (define-key term-raw-map (kbd "M-o") 'ace-window)
;;     (define-key term-raw-map (kbd "C-c C-l") 'comint-clear-buffer)))

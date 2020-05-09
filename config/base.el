;; Set up notification system for mac
(if (string-equal system-type "darwin")
    (setq alert-default-style 'osx-notifier))

; (global-set-key (kbd "M-o") 'ace-window)

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

;; (require 'ansi-color)
;; (defun colorize-compilation-buffer ()
;;   (read-only-mode nil)
;;   (ansi-color-apply-on-region compilation-filter-start (point))
;;   (read-only-mode))
;; (add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

;; (defun rhb-w3m-search (query)
;;   (interactive "MSearch Google: ")
;;   (let ((w3m-pop-up-windows t))
;;     (if (one-window-p) (split-window))
;;     (other-window 1)
;;     (w3m-search "google" query)))
;; (global-set-key (kbd "C-c g") 'rhb-w3m-search)

;; (defun rhb-w3m-open-current-page-in-system-browser ()
;;   (interactive)
;;   (browse-url w3m-current-url))

;; (add-hook 'w3m-mode-hook
;;           (lambda ()
;;             (define-key w3m-mode-map "f" 'rhb-w3m-open-current-page-in-system-browser)))

;; Pianobar
;; (defun rhb-pianobar-play-start-pause-dwim ()
;;   (interactive)
;;   (if (or (not (fboundp 'pianobar-play-or-pause))
;;           (not (comint-check-proc pianobar-buffer)))
;;       (pianobar)
;;     (pianobar-play-or-pause)))

;; (setq pianobar-username "rhburrows@gmail.com")
;; (setq pianobar-station "6")
;; (global-set-key (kbd "<f7>") 'rhb-pianobar-play-start-pause-dwim)
;; (global-set-key (kbd "<f8>") 'pianobar-next-song)

;; Setup terminal keybindins
;; (add-hook 'term-mode-hook
;;   (lambda () 
;;     (define-key term-raw-map (kbd "M-o") 'ace-window)
;;     (define-key term-raw-map (kbd "C-c C-l") 'comint-clear-buffer)))

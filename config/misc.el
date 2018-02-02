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

(global-set-key (kbd "C-c s") 'swap-windows)

(global-set-key (kbd "C-x g") 'magit-status)

(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (read-only-mode nil)
  (ansi-color-apply-on-region compilation-filter-start (point))
  (read-only-mode))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

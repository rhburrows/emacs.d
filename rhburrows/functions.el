;; Swap windows (stolen from Steve Yegge)
(defun swap-windows()
  "If you have 2 windows, it swaps them."
  (interactive)
  (cond ((not (= (count-windows) 2))
         (message "You need exactly 2 windows to do this."))
        (t
         (let*
             ((w1 (first (window-list)))
              (w2 (second (window-list)))
              (b1 (window-buffer w1))
              (b2 (window-buffer w2))
              (s1 (window-start w1))
              (s2 (window-start w2)))
           (set-window-buffer w1 b2)
           (set-window-buffer w2 b1)
           (set-window-start w1 s2)
           (set-window-start w2 s1)))))
(global-set-key (kbd "\C-c s") 'swap-windows)

(defun backward-kill-word-or-kill-region (&optional arg)
  (interactive "p")
  (if (region-active-p)
      (kill-region (region-beginning) (region-end))
    (backward-kill-word arg)))
(global-set-key "\C-w" 'backward-kill-word-or-kill-region)

;; Taken from whattheemacsd.com
(defun cleanup-buffer ()
  "Perform a bunch of safe operations on the whitespace content of a buffer.
Does not indent buffer, because that might be bad."
  (interactive)
  (untabify (point-min) (point-max))
  (delete-trailing-whitespace)
  (set-buffer-file-coding-system 'utf-8)
  (indent-region (point-min) (point-max)))
(global-set-key "\C-cn" 'cleanup-buffer)

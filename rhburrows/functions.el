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

(defun find-file-next-frame(filename)
  "If there is a second frame, run find-file there"
  (cond ((not multiple-frames)
         (message "Only one frame is present."))
        (t
         (let ((f (next-frame)))
           (select-frame f)
           (x-focus-frame f)
           (find-file filename)))))
(global-set-key "\C-x5f" 'find-file-next-frame)

(defun dired-find-file-next-frame ()
  "In dired, visit this file or directory in another frame."
  (interactive)
  (find-file-next-frame (file-name-sans-versions (dired-get-filename) t)))
(require 'dired)
(define-key dired-mode-map "e" 'dired-find-file-other-frame)

(defun backward-kill-word-or-kill-region (&optional arg)
  (interactive "p")
  (if (region-active-p)
      (kill-region (region-beginning) (region-end))
    (backward-kill-word arg)))
(global-set-key "\C-w" 'backward-kill-word-or-kill-region)

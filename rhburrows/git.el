;; C-c C-a to amend without an prompt
;; From http://whattheemacsd.com/setup-magit.el-05.html
(defun magit-just-amend ()
  (interactive)
  (save-window-excursion
    (magit-with-refresh
      (shell-command "git --no-pager commit --amend --reuse-message=HEAD"))))

(eval-after-load "magit"
  '(define-key magit-status-mode-map (kbd "C-c C-a") 'magit-just-amend))

(global-set-key (kbd "\C-x g") 'vc-git-grep)
(global-set-key (kbd "\C-c b") 'magit-blame)

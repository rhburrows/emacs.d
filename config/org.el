(require 'org-alert)

(setq org-agenda-files '("~/Dropbox/org"))

(global-set-key (kbd "C-c '") 'org-cycle-agenda-files)
(define-key org-mode-map (kbd "C-c z") 'org-time-stamp-inactive)

;; After 10 seconds idle alert due tasks
(run-with-idle-timer 10 nil 'org-alert-check)

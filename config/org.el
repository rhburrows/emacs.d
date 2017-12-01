(require 'org-alert)

(setq org-agenda-files '("~/Dropbox/org"))

;; After 10 seconds idle alert due tasks
(run-with-idle-timer 10 nil 'org-alert-check)

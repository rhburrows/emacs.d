(use-package vterm
  :custom
  ;; Not strictly terminal related but...
  (read-process-output-max (* 2 1024 1024))
  (process-adaptive-read-buffering nil)

  :hook
  ((vterm-mode . (lambda () (display-line-numbers-mode 0)))))

(use-package vterm-toggle
  :after (vterm)
  :bind (
         ("C-c t" . vterm-toggle)
         ))

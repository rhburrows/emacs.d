;; Setting rbenv path
(setenv "PATH" (concat (getenv "HOME") "/.rbenv/shims:" (getenv "HOME") "/.rbenv/bin:" (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (cons (concat (getenv "HOME") "/.rbenv/shims") (cons (concat (getenv "HOME") "/.rbenv/bin") exec-path)))

(eval-after-load 'company
  '(push 'company-robe company-backends))

(add-hook 'ruby-mode-hook 'company-mode)
(add-hook 'ruby-mode-hook 'robe-mode)



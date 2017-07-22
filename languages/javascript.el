(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))

(setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))

;; Set up flow
(add-hook 'web-mode-hook 'flow-minor-mode)
(with-eval-after-load 'company
  (add-to-list 'company-backends 'company-flow))

(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))

(setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))

(add-hook 'web-mode-hook 'electric-pair-mode)
(add-hook 'web-mode-hook
	  (lambda ()
	    (setq-local electric-pair-pairs '((?' . ?')))))

(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))

(setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))

(add-hook 'web-mode-hook 'electric-pair-mode)
(add-hook 'web-mode-hook
	  (lambda ()
	    (setq-local electric-pair-pairs (append electric-pair-pairs '((?' . ?'))))))
(add-hook 'web-mode-hook 'flow-minor-mode)

(defun my/use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
		(or (buffer-file-name) default-directory)
		"node_modules"))
	 (eslint (and root
		      (expand-file-name "node_modules/eslint/bin/eslint.js"
					root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))

(defun my/use-flow-from-node-modules ()
  (let* ((root (locate-dominating-file
		(or (buffer-file-name) default-directory)
		"node_modules"))
	 (flow (and root
		    (expand-file-name "node_modules/flow-bin/vendor/flow"
				      root))))
    (when (and flow (file-executable-p flow))
      (setq-local flycheck-javascript-flow-executable flow))))

(add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)
(add-hook 'flycheck-mode-hook #'my/use-flow-from-node-modules)

(require 'flycheck-flow)
(customize-set-variable 'flycheck-javascript-flow-args '("--respect-pragma"))
(flycheck-add-next-checker 'javascript-flow 'javascript-eslint)
(flycheck-add-mode 'javascript-eslint 'web-mode)
(flycheck-add-mode 'javascript-flow 'web-mode)

(with-eval-after-load 'company
  (add-to-list 'company-backends 'company-flow))

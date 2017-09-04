(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))

(setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))

(add-hook 'web-mode-hook 'electric-pair-mode)
(add-hook 'web-mode-hook
	  (lambda ()
	    (setq-local electric-pair-pairs '((?' . ?')))))
(add-hook 'web-mode-hook 'flow-minor-mode)

(defun rhb/use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
		(or (buffer-file-name) default-directory)
		"node_modules"))
	 (eslint (and root
		      (expand-file-name "node_modules/eslint/bin/eslint.js"
					root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))

(defun rhb/use-flow-from-node-modules ()
  (let* ((root (locate-dominating-file
		(or (buffer-file-name) default-directory)
		"node_modules"))
	 (flow (and root
		    (expand-file-name "node_modules/flow-bin/vendor/flow"
				      root))))
    (when (and flow (file-executable-p flow))
      (setq-local flycheck-javascript-flow-executable flow))))

(add-hook 'flycheck-mode-hook #'rhb/use-eslint-from-node-modules)
(add-hook 'flycheck-mode-hook #'rhb/use-flow-from-node-modules)

(load-vendor-file "flycheck-flow.el")
(require 'flycheck-flow)

(customize-set-variable 'flycheck-javascript-flow-args '("--respect-pragma"))
(flycheck-add-mode 'javascript-eslint 'web-mode)
(flycheck-add-mode 'javascript-flow 'web-mode)
(flycheck-add-next-checker 'javascript-flow 'javascript-eslint)

(with-eval-after-load 'company
  (add-to-list 'company-backends 'company-flow))

;; react-native stuff
(defun rhb/react-native-run (cmd)
  (interactive "scommand: ")
  (let* ((root (locate-dominating-file
		(or (buffer-file-name) default-directory)
		"node_modules"))
	 (react-native (and root
			    (expand-file-name "node_modules/.bin/react-native"
					      root))))
    (if (and react-native (file-executable-p react-native))
	(let ((default-directory root))
	  (compile (concat react-native " " cmd)))
      (message "This doesn't look like a react-native project"))))

(with-eval-after-load 'web-mode
  (define-key web-mode-map (kbd "C-c r") 'rhb/react-native-run))

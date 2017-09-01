; (package-initialize)

(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory)
	 user-emacs-directory)
	((boundp 'user-init-directory)
	 user-init-directory
	 (t "~/.emacs.d/"))))

(defun load-user-file (file)
  (interactive "f")
  "Load a file in the current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))

; We need to load custom before packages because it stores the packages to install
(setq custom-file (expand-file-name "custom.el" user-init-dir))
(load custom-file)


(load-user-file "config/packages.el")
(load-user-file "config/files.el")
(load-user-file "config/theme.el")
(load-user-file "config/keys.el")

(load-user-file "languages/javascript.el")

(exec-path-from-shell-initialize)
(add-hook 'after-init-hook 'global-company-mode)

;; flycheck setup
(global-flycheck-mode)
(setq-default flycheck-disabled-checkers
	      (append flycheck-disabled-checkers
		      '(javascript-jshint)))
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
; (package-initialize)

(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory)
	 user-emacs-directory)
	((boundp 'user-init-directory)
	 user-init-directory)
	(t "~/.emacs.d/")))

(defun load-user-file (file)
  (interactive "f")
  "Load a file in the current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))

(defun load-vendor-file (file)
  (interactive "f")
  "Load a file in the vendor directory"
  (load-user-file (concat "vendor/" file)))

; We need to load custom before packages because it stores the packages to install
(setq custom-file (expand-file-name "custom.el" user-init-dir))
(load custom-file)

(load-user-file "config/packages.el")
(load-user-file "config/misc.el")
(load-user-file "config/editor.el")
(load-user-file "config/files.el")
(load-user-file "config/org.el")
(load-user-file "config/theme.el")

(require 'flycheck)
(load-user-file "languages/javascript.el")
(load-user-file "languages/typescript.el")
(load-user-file "languages/php.el")
(load-user-file "languages/lisp.el")

(exec-path-from-shell-initialize)
(add-hook 'after-init-hook 'global-company-mode)

(global-flycheck-mode)
(projectile-mode)

;; Make sure to load after other packages it integrates with
(load-user-file "config/projectile.el")
(load-user-file "config/helm.el")

(add-to-list 'auto-mode-alist '("\\.http$" . restclient-mode))

;; Start an emacs server
(server-start)

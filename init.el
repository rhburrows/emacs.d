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

(load-user-file "config/base.el")
(load-user-file "config/eshell.el")
(load-user-file "config/projectile.el")
(load-user-file "config/lsp.el")
(load-user-file "config/theme.el")
(load-user-file "config/tools.el")
(load-user-file "config/fun.el")

(load-user-file "languages/typescript.el")
(load-user-file "languages/go.el")
(load-user-file "languages/markdown.el")
(load-user-file "languages/php.el")
(load-user-file "languages/yaml.el")

(if (file-exists-p (expand-file-name "config/private.el" user-init-dir))
    (load-user-file "config/private.el"))

;; Start an emacs server
(server-start)

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
(load-user-file "config/theme.el")
(load-user-file "config/misc.el")

;; Start an emacs server
(server-start)

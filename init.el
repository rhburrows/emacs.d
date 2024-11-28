;; This is the minimum major Emacs version I've testing this config on
(defconst minimum-major-emacs-version 29)

(when (< emacs-major-version minimum-major-emacs-version)
  (warn (concat "Emacs version is lower than the minimum expected of " minimum-major-emacs-version)))

;; Setup and configure straight.el for package management
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

;; Load exec-path-from-shell early to fix Mac OSX Sequoia issues
;; Its not properly loading the PATH when launched from outside the terminal
;; https://github.com/d12frosted/homebrew-emacs-plus/issues/720
(use-package exec-path-from-shell
  :straight t
  :demand t
  :init (exec-path-from-shell-initialize))

;; Ideally this would be determined dynamically based user-emacs-directory but that isn't being set correctly at startup
(defconst user-init-dir "~/.emacs.d/")

(defun load-config-file (file)
  (interactive "f")
  "Load a file in the current user's configuration directory"
  (load-file (expand-file-name
		          (file-name-concat user-init-dir "config" file))))

(use-package gcmh
  :straight t
  :demand
  :config
  (gcmh-mode t))

(load-config-file "emacs.el")
(load-config-file "theme.el")
(load-config-file "git.el")
(load-config-file "misc.el")

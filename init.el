;; This is the minimum major Emacs version I've testing this config on
(defconst minimum-major-emacs-version 30)

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

(setopt straight-use-package-by-default t)
(straight-use-package 'use-package)

;; Load exec-path-from-shell early to fix Mac OSX Sequoia issues
;; Its not properly loading the PATH when launched from outside the terminal
;; https://github.com/d12frosted/homebrew-emacs-plus/issues/720
(use-package exec-path-from-shell
  :demand t
  :init (exec-path-from-shell-initialize))

;; Force early loading of org-mode so there isn't a version mismatch later
(straight-use-package 'org)

;; Ideally this would be determined dynamically based user-emacs-directory but that isn't being set correctly at startup
(defconst user-init-dir "~/.emacs.d/")
(defconst site-lisp-dir (expand-file-name (concat user-init-dir "site-lisp/")))
(add-to-list 'load-path site-lisp-dir)

(defun load-config-file (file)
  (interactive "f")
  "Load a file in the current user's configuration directory"
  (load-file (expand-file-name
		          (file-name-concat user-init-dir "config" file))))

(use-package gcmh
  :demand
  :config
  (gcmh-mode t))

(load-config-file "emacs.el")
(load-config-file "docs.el")
(load-config-file "ibuffer.el")
(load-config-file "theme.el")
(load-config-file "git.el")
(load-config-file "completion.el")
(load-config-file "dired.el")
(load-config-file "diff.el")
(load-config-file "prog.el")
(load-config-file "undo.el")
(load-config-file "terminal.el")
(load-config-file "eshell.el")
(load-config-file "docker.el")
(load-config-file "ai.el")
(load-config-file "verb.el")
(load-config-file "org.el")
(load-config-file "bib.el") ; must be after org

;; Language specific configurations
(load-config-file "go.el")
(load-config-file "java.el")
(load-config-file "json.el")
(load-config-file "markdown.el")
(load-config-file "neon.el")
(load-config-file "php.el")
(load-config-file "rust.el")
(load-config-file "sql.el")
(load-config-file "typescript.el")
(load-config-file "yaml.el")
(load-config-file "zig.el")

;; Allow for machine-specific overrides (e.g. for work machine configurations)
(when (file-exists-p (expand-file-name "~/.local.el"))
  (load-file (expand-file-name "~/.local.el")))
;; Also store custom settings in the local machine only. Use proper config for settings to share
(setopt custom-file (expand-file-name (file-name-concat user-init-dir "custom.el")))
(when (file-exists-p custom-file)
  (load custom-file))

;; Start things off in eshell
(eshell)

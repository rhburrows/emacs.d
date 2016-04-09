(setq custom-file (expand-file-name "~/.emacs.d/custom.el"))
(load custom-file)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(auto-complete
                      coffee-mode
                      dash-at-point
                      elm-mode
                      feature-mode
                      haml-mode
                      handlebars-mode
                      gist
                      jsx-mode
                      magit
                      markdown-mode
                      rspec-mode
                      sass-mode
                      scss-mode
                      undo-tree
                      yaml-mode)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(mapc 'load (directory-files (concat user-emacs-directory user-login-name)
                             t "^[^#].*el$"))

(global-set-key "\M-s" 'tags-search)
(global-set-key "\C-cg" 'magit-status)
(global-set-key "\C-cf" 'ido-find-file)
(global-set-key "\C-xb" 'ido-switch-buffer)

(setq-default indent-tabs-mode nil)

(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.feature$" . feature-mode))

(setq ffap-machine-p-known 'reject)

(require 'auto-complete-config)
(ac-config-default)
(setq ac-ignore-case nil)
(add-to-list 'ac-modes 'ruby-mode)

(eshell)

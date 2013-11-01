(setq custom-file (expand-file-name "~/.emacs.d/custom.el"))
(load custom-file)

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(auto-complete
                      clojure-mode
                      coffee-mode
                      csharp-mode
                      feature-mode
                      haml-mode
                      haskell-mode
                      gist
                      lua-mode
                      magit
                      markdown-mode
                      nrepl
                      org2blog
                      php-mode
                      rspec-mode
                      scala-mode
                      smartparens
                      starter-kit
                      starter-kit-eshell
                      starter-kit-lisp
                      starter-kit-ruby
                      undo-tree
                      zenburn-theme)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(global-set-key "\M-s" 'tags-search)
(global-set-key "\C-cg" 'magit-status)
(global-set-key "\C-xg" 'webjump)

(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.feature$" . feature-mode))

(setq ffap-machine-p-known 'reject)

(require 'auto-complete-config)
(ac-config-default)
(setq ac-ignore-case nil)
(add-to-list 'ac-modes 'ruby-mode)

(require 'smartparens-ruby)
(smartparens-global-mode)
(show-smartparens-global-mode t)

(eshell)

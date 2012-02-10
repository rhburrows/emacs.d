(setq custom-file (expand-file-name "~/.emacs.d/custom.el"))
(load custom-file)

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(coffee-mode
                      feature-mode
                      haskell-mode
                      magit
                      starter-kit
                      starter-kit-eshell
                      zenburn-theme)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(global-set-key "\M-s" 'tags-search)

(setq woman-use-own-frame nil)
(global-set-key "\C-cm" 'woman)

(global-set-key "\C-cg" 'magit-status)
(add-hook 'magit-mode-hook
          '(lambda ()
             (define-key magit-mode-map (kbd "C-c s") 'diff-goto-source)))

(setq-default ispell-program-name "aspell")

(eshell)

(use-package vertico
  :config
  (vertico-mode)
  (vertico-mouse-mode))

(use-package savehist
  :config
  (savehist-mode))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package marginalia
  :bind (:map minibuffer-local-map
              ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode))

(use-package embark
  :bind
  (("C-." . embark-act)
   ("C-;" . embark-dwim)
   ("C-h B" . embark-bindings))

  :custom
  (prefix-help-command #'embark-prefix-help-command))

(use-package embark-consult)

(use-package consult
  :bind (
         ("C-x b" . consult-buffer)
         ("C-x r b" . consult-bookmark)
         ("M-g g" . consult-goto-line)
         ("M-s r" . consult-ripgrep)
         ("M-y" . consult-yank-pop)
         ))

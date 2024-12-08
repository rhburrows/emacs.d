(use-package vertico
  :config
  (vertico-mode)
  (vertico-mouse-mode)
  :custom
  (vertico-cycle t))

(use-package savehist
  :config
  (savehist-mode))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-default nil)
  (completion-category-overrides '((file (styles partial-completion)))))

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
         ("C-x p b" . consult-project-buffer)
         ("C-h i" . consult-info)
         ("C-s" . consult-line)
         ("M-g g" . consult-goto-line)
         ("M-g M-g" . consult-goto-line)
         ("M-g i" . consult-imenu)
         ("M-s r" . consult-ripgrep)
         ("M-s u" . consult-focus-lines)
         ("M-y" . consult-yank-pop)
         ))

(use-package corfu
  :custom
  (corfu-auto t)
  (corfu-auto-delay 0.5)

  :init
  (global-corfu-mode)

  :config
  (keymap-set corfu-map "RET" `( menu-item "" nil :filter
                                 ,(lambda (&optional _)
                                    (and (derived-mode-p 'eshell-mode 'comint-mode)
                                         #'corfu-send)))))

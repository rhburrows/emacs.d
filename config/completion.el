(use-package vertico
  :config
  (vertico-mode)
  (vertico-mouse-mode)
  :custom
  (vertico-cycle t)
  (vertico-prompt directory))

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
              ("M-Z" . marginalia-cycle))
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

(use-package wgrep)

(use-package consult
  :bind (
         ("C-x b" . consult-buffer)
         ("M-y" . consult-yank-pop)
         ("C-h i" . consult-info)

         ("C-x r b" . consult-bookmark)
         ("C-x p b" . consult-project-buffer)

         ("M-g g" . consult-goto-line)
         ("M-g M-g" . consult-goto-line)
         ("M-s u" . consult-focus-lines)

         ;; Search-related functions
         ("C-s" . consult-line)
         ("M-g i" . consult-imenu)
         ("M-g I" .  consult-imenu-multi)
         ("M-g f" . consult-flycheck)
         ("M-s r" . consult-ripgrep)))

(consult-customize
 consult-line consult-imenu consult-imenu-multi consult-flycheck consult-ripgrep
 :keymap (let ((map (make-sparse-keymap)))
           (define-key map (kbd "M-e") #'embark-export)
           map)

 consult-line
 :keymap (let ((map (make-sparse-keymap)))
           (define-key map (kbd "C-s") #'previous-history-element)
           map))

(use-package corfu
  :custom
  (corfu-auto t)
  (corfu-auto-delay 0.5)
  (corfu-cycle t)

  :init
  (global-corfu-mode)

  :bind
  (:map corfu-map ("ESC" . corfu-quit))

  :config
  (keymap-set corfu-map "RET" `( menu-item "" nil :filter
                                 ,(lambda (&optional _)
                                    (and (derived-mode-p 'eshell-mode 'comint-mode)
                                         #'corfu-send)))))

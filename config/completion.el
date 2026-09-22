;; -*- lexical-binding: t; -*-

(use-package emacs
  :custom
  (tab-always-indent 'complete)
  ()
  (completion-styles '(basic initials substring)))

(use-package vertico
  :config
  (vertico-mode)
  (vertico-mouse-mode)

  :custom
  (vertico-count 15)
  (vertico-resize 'grow-only)
  (vertico-cycle t))

(use-package savehist
  :config
  (savehist-mode))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-default nil)
  (completion-category-overrides '((file (styles partial-completion))))
  (completion-pcm-leading-wildcard t))

(use-package marginalia
  :bind (:map minibuffer-local-map
              ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode)

  :custom
  (marginalia-align 'right))

(use-package embark
  :bind
  (("C-." . embark-act)
   ("C-;" . embark-dwim)
   ("C-h B" . embark-bindings))

  :custom
  (prefix-help-command #'embark-prefix-help-command))

(use-package embark-consult
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(use-package wgrep)

(use-package consult
  :ensure t
  :bind (
         ("C-x b" . consult-buffer)
         ("C-x 4 b" . consult-buffer-other-window)
         ("C-x 5 b" . consult-buffer-other-frame)
         ("C-x t b" . consult-buffer-other-tab)
         ("M-y" . consult-yank-pop)
         ("C-h i" . consult-info)

         ("C-x r b" . consult-bookmark)
         ("C-x p b" . consult-project-buffer)

         ("M-g g" . consult-goto-line)
         ("M-g M-g" . consult-goto-line)
         ("M-g x" . consult-mark)
         ("M-s u" . consult-focus-lines)

         ;; Search-related functions
         ("C-s" . consult-line)
         ("M-g i" . consult-imenu)
         ("M-g I" .  consult-imenu-multi)
         ("M-g f" . consult-flymake)
         ("M-s r" . consult-ripgrep))

  :custom
  (consult-narrow-key "<")

  :config
  (consult-customize
   consult-line consult-imenu consult-imenu-multi consult-flymake consult-ripgrep
   :keymap (let ((map (make-sparse-keymap)))
             (define-key map (kbd "M-e") #'embark-export)
             map)

   consult-line
   :keymap (let ((map (make-sparse-keymap)))
             (define-key map (kbd "C-s") #'previous-history-element)
             map)))

(use-package consult-project-extra
  :bind
  (("C-x p f" . consult-project-extra-find))

  :custom
  (consult-project-function #'consult-project-extra-project-fn))


(use-package corfu
  :custom
  (corfu-cycle t)
  (corfu-quit-no-match t)

  :init
  (global-corfu-mode)

  :bind
  (:map corfu-map ("ESC" . corfu-quit))

  :config
  (keymap-set corfu-map "RET" `( menu-item "" nil :filter
                                 ,(lambda (&optional _)
                                    (and (derived-mode-p 'eshell-mode 'comint-mode)
                                         #'corfu-send)))))

;; -*- lexical-binding: t; -*-

(use-package ghostel
  :bind (:map ghostel-semi-char-mode-map
              ("C-s" . consult-line))

  :hook (ghostel-mode-hook . (lambda ()
                               (local-unset-key (kbd "M-o"))
                               (display-line-numbers-mode -1)
                               (buffer-disable-undo)
                               (setq-local truncate-linst t)
                               (setq-local nobreak-char-display nil)
                               (setq-local bidi-paragraph-direction 'left-to-right)
                               (setq-local bidi-inhibit-bpa t)
                               (setq-local scroll-conservatively most-positive-fixnum)
                               (setq-local hscroll-margin 0)
                               (setq-local scroll-margin 0)
                               (setq-local auto-hscroll-mode nil)
                               (setq-local process-adaptive-read-buffering nil)
                               (setq-local font-lock-defaults '(nil t))))

  :custom
  (ghostel-comint-global-mode 1)
  (ghostel-timer-delay 0.01)
  (ghostel-max-scrollback (* 1024 1024)))

(use-package consult-ghostel
  :straight (consult-ghostel
             :type git
             :host github
             :repo "dakra/ghostel"
             :files ("extensions/consult-ghostel/*.el"))
  :demand t 

  :bind (("C-c t" . consult-ghostel)
         ("C-c C-t" . ghostel-list-buffers)
         :map project-prefix-map
         ("t" . consult-ghostel-project)
         :map ghostel-semi-char-mode-map
         ("C-r" . consult-ghostel-history))

  :config
  (add-to-list 'project-switch-commands '(consult-ghostel-project "Ghostel") t))

(use-package ghostel-shell-command
  :straight nil
  :after ghostel
  :hook (after-init . ghostel-shell-command-global-mode))

(use-package ghostel-compile
  :straight nil
  :after ghostel
  :hook (after-init . ghostel-compile-global-mode))

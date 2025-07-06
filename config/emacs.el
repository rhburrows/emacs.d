(use-package emacs
  :config
  (defvar-keymap scroll-keymap
    :repeat t
    "u" #'scroll-down-command
    "v" #'scroll-up-command)

  ;; Originally from
  ;; https://emacsredux.com/blog/2025/06/01/let-s-make-keyboard-quit-smarter/
  (define-advice keyboard-quit
      (:around (quit) quit-current-context)
    "Quit the current context.

When there is an active minibuffer and we are not inside it close
it.  When we are inside the minibuffer use the regular
`minibuffer-keyboard-quit' which quits any active region before
exiting.  When there is no minibuffer `keyboard-quit' unless we
are defining or executing a macro."
    (if (active-minibuffer-window)
        (if (minibufferp)
            (minibuffer-keyboard-quit)
          (abort-recursive-edit))
      (unless (or defining-kbd-macro
                  executing-kbd-macro)
        (funcall-interactively quit))))
  
  :custom
  (jit-lock-defer-time 0.05)
  (read-process-output-max (* 1024 1024))

  (inhibit-splash-screen t)
  (initial-scratch-message nil)
  (visible-bell t)

  (windmove-default-keybindings)

  (menu-bar-mode nil)
  (tool-bar-mode nil)
  (scroll-bar-mode nil)
  (display-time-mode t)
  (global-display-line-numbers-mode t)
  (electric-pair-mode t)
  (show-paren-mode t)
  (global-auto-revert-mode t)
  (repeat-mode t)
  (set-charset-priority 'unicode)
  (redisplay-skip-fontification-on-input t)
  (inhibit-compacting-font-caches t)

  (bidi-display-reordering 'left-to-right))

(use-package which-key
  :demand
  :config
  (which-key-mode))

(use-package ace-window
  :config
  (global-set-key (kbd "M-o") 'ace-window)
  (global-set-key (kbd "C-c s") 'ace-swap-window))

(use-package devil
  :config
  (global-devil-mode t)

  :custom
  (devil-prompt "\U0001F608 %t"))

(use-package flyspell-correct
  :after flyspell
  :bind
  (:map flyspell-mode-map ("C-;" . flyspell-correct-wrapper)))

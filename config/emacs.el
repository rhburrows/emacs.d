(use-package emacs
  :custom
  (inhibit-splash-screen t)
  (initial-scratch-message nil)
  (visible-bell t)
  (column-number-mode t)
  (whitespace-line-column 80)
  (whitespace-style '(face tabs empty trailing lines-tail))
  (locale-coding-system 'utf-8)
  (coding-system-for-read 'utf-8)
  (default-process-coding-system '(utf-8-unix . utf-8-unix))
  (global-auto-revert-non-file-buffers t)
  (make-backup-files nil)
  (auto-save-default nil)
  (tab-width 2)
  (indent-tabs-mode nil)
  (xref-search-program 'ripgrep)
  (frame-resize-pixelwise t)
  (ns-pop-up-frames nil)
  (winner-mode 1)
  (editorconfig-mode 1)

  (enable-recursive-minibuffers t)
  (read-extended-command-predicate #'command-completion-default-include-p)

  :config
  (require 'whitespace)
  (defalias 'yes-or-no-p 'y-or-n-p)
  (windmove-default-keybindings)

  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (display-time-mode t)
  (global-display-line-numbers-mode 1)
  (electric-pair-mode t)
  (show-paren-mode t)
  (global-auto-revert-mode t)
  (repeat-mode)

  (defvar-keymap scroll-keymap
    :repeat t
    "u" #'scroll-down-command
    "v" #'scroll-up-command)

  (set-charset-priority 'unicode)

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
        (funcall-interactively quit)))))

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
  (global-devil-mode)

  :custom
  (devil-prompt "\U0001F608 %t"))

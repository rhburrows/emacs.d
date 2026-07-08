;; -*- lexical-binding: t; -*-

(use-package ibuffer
  :config
  (setq ibuffer-saved-filter-groups
        '(("default"
           ("Claude Code" (name . "^\\*claude-code"))

           ("Programming" (and
                           (derived-mode . prog-mode)
                           (not (name . "^\\*scratch\\*$"))))

           ("Git" (name . "^\\magit:"))
           ("Terminal" (or
                        (mode . eshell-mode)
                        (mode . ghostel-mode)))
           ("Org" (and
                   (not (name . "^\\.remarks.org$"))
                   (mode . org-mode)))
           ("Dired" (mode . dired-mode))
           ("Emacs" (or
                     (name . "^\\*scratch\\*$")
                     (name . "^\\*Messages\\*$")
                     (name . "^\\*Async-native-compile-log\\*$")
                     (name . "^\\*straight-process\\*$")
                     (name . "^\\*Backtrace\\*$")
                     (name . "^\\*dashboard\\*$")))
           ("Help" (or
                    (mode . help-mode)
                    (mode . Info-mode)
                    (mode . helpful-mode))))))

  (define-ibuffer-column icon
    (:name "" :inline t)
    (cond
     ((buffer-file-name)
      (nerd-icons-icon-for-buffer))
     (major-mode (nerd-icons-icon-for-mode major-mode))
     (t "")))

  :bind
  (:map global-map ("C-x C-b" . ibuffer))

  :hook
  (ibuffer-mode . hl-line-mode)
  (ibuffer-mode . (lambda ()
                    (display-line-numbers-mode -1)
                    (local-unset-key (kbd "M-o"))
                    (ibuffer-switch-to-saved-filter-groups "default")))

  :custom
  (ibuffer-expert t)
  (ibuffer-display-summary nil)
  (ibuffer-human-readable-size t)
  (ibuffer-default-sorting-mode 'recency)
  (ibuffer-default-shrink-to-minimum-size nil)
  (ibuffer-show-empty-filter-groups nil)
  (ibuffer-formats
   '((mark modified read-only locked " "
           (icon 2 2)
           (name 30 30 :left :elide)
           " "
           (size 9 -1 :right)
           " "
           (mode 16 16 :left :elide)
           " " filename-and-process)
     (mark " "
           (name 16 -1)
           " " filename))))

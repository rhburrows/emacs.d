;; -*- lexical-binding: t; -*-

(use-package ibuffer
  :config
  (global-set-key (kbd "C-x C-b") 'ibuffer)
  (setq ibuffer-saved-filter-groups
        '(("default"
           ("Claude Code" (name . "^\\*claude-code"))

           ("Programming" (and
                           (derived-mode . prog-mode)
                           (not (name . "^\\*scratch\\*$"))))

           ("Git" (name . "^\\magit"))
           ("Terminal" (or
                        (mode . eshell-mode)
                        (mode . ghostel-mode)))
           ("Dired" (mode . dired-mode))
           ("Emacs" (or
                     (name . "^\\*scratch\\*$")
                     (name . "^\\*Messages\\*$")
                     (name . "^\\*Async-native-compile-log\\*$")
                     (name . "^\\*straight-process\\*$")
                     (name . "^\\*dashboard\\*$")))
           ("Help" (or
                    (mode . help-mode)
                    (mode . Info-mode)
                    (mode . helpful-mode))))))

  :hook
  (ibuffer-mode . (lambda ()
                    (local-unset-key (kbd "M-o")) ; We want ace-window to be truly global
                    (ibuffer-switch-to-saved-filter-groups "default")))

  :custom
  (ibuffer-expert t)
  (ibuffer-human-readable-size t)
  (ibuffer-default-sorting-mode 'recency)
  (ibuffer-show-empty-filter-groups nil))

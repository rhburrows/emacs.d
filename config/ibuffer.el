(use-package ibuffer
  :config
  (global-set-key (kbd "C-x C-b") 'ibuffer)
  (setq ibuffer-saved-filter-groups
        '(("default"
           ("Terminal" (or
                        (mode . eshell-mode)
                        (mode . eat-mode)))
           ("Programming" (and
                           (derived-mode . prog-mode)
                           (not (name . "^\\*scratch\\*$"))))
           ("Dired" (mode . dired-mode))
           ("Magit" (name . "^\\*magit"))
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
                    (ibuffer-switch-to-saved-filter-groups "default")))

  :custom
  (ibuffer-expert t)
  (ibuffer-default-sorting-mode 'recency)
  (ibuffer-show-empty-filter-groups nil))

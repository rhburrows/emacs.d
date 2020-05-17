
(use-package eshell
  :ensure t
  :init
  (defun eshell-clear-buffer ()
    (interactive)
    (let ((inhibit-read-only t))
      (erase-buffer)
      (eshell-send-input)))
  :bind
  ("C-c t" . eshell)
  :init
  (add-hook 'eshell-mode-hook
            (lambda ()
              (bind-keys :map eshell-mode-map
                         ("C-l" . eshell-clear-buffer))))

  :config
  (defalias 'eshell/e 'find-file)

  (use-package eshell-prompt-extras
    :ensure t
    :config
    (setq eshell-highlight-prompt nil)
    (setq eshell-prompt-function 'epe-theme-lambda)))

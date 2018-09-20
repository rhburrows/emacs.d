(defun toggle-php-web-mode ()
  (interactive)
  (cond ((string-prefix-p "PHP" mode-name)
         (web-mode))
        ((string= mode-name "Web")
         (php-mode))))

(defun rhb-php-mode-hook ()
  (setq indent-tabs-mode t)
  (setq c-basic-offset 4)
  (local-set-key [f9] 'toggle-php-web-mode))

(add-hook 'php-mode-hook 'rhb-php-mode-hook)
(add-hook 'web-mode-hook (lambda () (local-set-key [f9] 'toggle-php-web-mode)))

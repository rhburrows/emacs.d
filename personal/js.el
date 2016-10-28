(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js2-jsx-mode))

;; autofix closure imports on save
;(eval-after-load 'js2-mode '(add-hook 'before-save-hook 'js2-closure-save-hook))

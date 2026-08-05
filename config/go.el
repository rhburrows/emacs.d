;; -*- lexical-binding: t; -*-


(use-package go-ts-mode
  :after consult

  :mode (("\\.go\\'" . go-ts-mode)
         ("/go\\.mod\\'" . go-mod-ts-mode))

  :hook (go-ts-mode . eglot-ensure)

  :custom
  (go-ts-mode-indent-offset 2)

  :config
  (add-to-list 'consult-imenu-config
               '(go-ts-mode :toplevel "Function"
                            :types ((?f "Function" font-lock-function-name-face)
                                    (?m "Method" font-lock-function-name-face)
                                    (?s "Struct" font-local-type-face)
                                    (?i "Interface" font-local-type-face)
                                    (?t "Type" font-local-type-face)
                                    (?a "Alias" font-local-type-face)))))


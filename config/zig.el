(use-package eglot
  :config
  (add-to-list 'eglot-server-programs
               '(zig-mode . ("zls"))))

(use-package zig-mode
  :after eglot
  :hook (zig-mode . eglot-ensure))

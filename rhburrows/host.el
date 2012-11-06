;; This is for customizations specific to the computer being run

(if (string= system-name "dragonbrains")
    (progn
      (setq inferior-lisp-program "/usr/bin/sbcl")
      (load (expand-file-name "~/quicklisp/slime-helper.el"))

      (setq browse-url-browser-function 'browse-url-generic
         browse-url-generic-program "/usr/bin/conkeror")

      (add-to-list 'exec-path "/home/rhburrows/bin")
      (add-to-list 'exec-path "/home/rhburrows/flex/bin")))

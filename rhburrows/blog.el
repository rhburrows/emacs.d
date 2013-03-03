(require 'netrc)

(setq blog (netrc-machine (netrc-parse "~/.netrc")
                          "programmingandprose" t))
(setq org2blog/wp-blog-alist
      '(("programmingandprose"
         :url "http://programmingandprose.com/xmlrpc.php"
         :username (netrc-get blog "login")
         :password (netrc-get blog "password")
         :default-title "TITLE_PLACEHOLDER")))

(setq blog-directory "~/Dropbox/blog/posts/")
(defadvice org2blog/wp-new-entry (after save-new-blog-entry () activate)
  "Prompt for a post title and save the entry in the appropriate directory."
  (let* ((title (read-from-minibuffer "Entry title: "))
         (file-title (concat
                      blog-directory
                      (downcase (replace-regexp-in-string " " "-" title))
                      ".org")))
    (progn
      (rename-buffer file-title)
      (replace-string "TITLE_PLACEHOLDER" title nil (point-min) (point-max))
      (write-file file-title))))

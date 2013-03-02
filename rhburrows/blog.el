(require 'netrc)

(setq blog (netrc-machine (netrc-parse "~/.netrc")
                          "programmingandprose" t))
(setq org2blog/wp-blog-alist
      '(("programmingandprose"
         :url "http://programmingandprose.com/xmlrpc.php"
         :username (netrc-get blog "login")
         :password (netrc-get blog "password"))))

;; DuckDB interpreter support for sql-interactive-mode
;; From: https://github.com/shoover/emacs.d/blob/main/lisp/sql-duckdb.el

;; This is copied from sqlite interpreter support in sql.el.

;; I had to add this in .emacs on my Windows machine to fix the continuation prompt.
;; (add-to-list 'process-coding-system-alist '("[dD]uck[dD][bB]" . utf-8-unix))

;; License: GPL, like emacs and sql.el

(require 'sql)

(defvar sql-duckdb-program "duckdb"
  "Path to the DuckDB CLI executable.

On Windows installed with WinGet, use
c:/Users/USERID/AppData/Local/Microsoft/WinGet/Links/duckdb.exe.")

(defcustom sql-duckdb-options '("-interactive")
  "List of additional options for `sql-duckdb-program'."
  :type '(repeat string)
  :version "20.8")

(defcustom sql-duckdb-login-params '((database :file nil
                                               :must-match confirm))
  "List of login parameters needed to connect to DuckDB."
  :type 'sql-login-params
  :version "26.1")

(defun sql-comint-duckdb (product options &optional buf-name)
  "Create comint buffer and connect to DuckDB."
  ;; Put all parameters to the program (if defined) in a list and call
  ;; make-comint.
  (let ((params
         (append options
                 (if (not (string= "" sql-database))
                     `(,(expand-file-name sql-database))))))
    (sql-comint product params buf-name)))

(defun sql-duckdb-completion-object (sqlbuf _schema)
  ;; FIXME: make duckdb-specific
  (sql-redirect-value sqlbuf ".tables" "\\sw\\(?:\\sw\\|\\s_\\)*" 0))

(add-to-list 'sql-product-alist
             '(duckdb
               :name "DuckDB"
               :free-software t
               :font-lock sql-mode-duckdb-font-lock-keywords
               :sqli-program sql-duckdb-program
               :sqli-options sql-duckdb-options
               :sqli-login sql-duckdb-login-params
               :sqli-comint-func sql-comint-duckdb
               :list-all ".tables"      ;; FIXME
               :list-table ".schema %s" ;; FIXME
               :completion-object sql-duckdb-completion-object
               :prompt-regexp "^D "
               :prompt-length 2
               :prompt-cont-regexp "^· "))

(defun sql-duckdb (&optional buffer)
  "Run DuckDB as an inferior process.

DuckDB is free software.

If buffer `*SQL*' exists but no process is running, make a new process.
If buffer exists and a process is running, just switch to buffer
`*SQL*'.

Interpreter used comes from variable `sql-duckdb-program'.  Login uses
the variables `sql-user', `sql-password', `sql-database', and
`sql-server' as defaults, if set.  Additional command line parameters
can be stored in the list `sql-duckdb-options'.

The buffer is put in SQL interactive mode, giving commands for sending
input.  See `sql-interactive-mode'.

To set the buffer name directly, use \\[universal-argument]
before \\[sql-duckdb].  Once session has started,
\\[sql-rename-buffer] can be called separately to rename the
buffer.

To specify a coding system for converting non-ASCII characters
in the input and output to the process, use \\[universal-coding-system-argument]
before \\[sql-duckdb].  You can also specify this with \\[set-buffer-process-coding-system]
in the SQL buffer, after you start the process.
The default comes from `process-coding-system-alist' and
`default-process-coding-system'.

\(Type \\[describe-mode] in the SQL buffer for a list of commands.)"
  (interactive "P")
  (sql-product-interactive 'duckdb buffer))

;; FIXME
(defvar sql-mode-duckdb-font-lock-keywords sql-mode-postgres-font-lock-keywords)

(provide 'sql-duckdb)

;; This is copied from sqlite interpreter support in sql.el.

;; I had to add this in .emacs on my Windows machine to fix the continuation prompt.
;; (add-to-list 'process-coding-system-alist '("[dD]uck[dD][bB]" . utf-8-unix))

;; License: GPL, like emacs and sql.el

(require 'sql)

(defvar sql-duckdb-program "duckdb"
  "Path to the DuckDB CLI executable.

On Windows installed with WinGet, use
c:/Users/USERID/AppData/Local/Microsoft/WinGet/Links/duckdb.exe.")

(defcustom sql-duckdb-options '("-interactive")
  "List of additional options for `sql-duckdb-program'."
  :type '(repeat string)
  :version "20.8")

(defcustom sql-duckdb-login-params '((database :file nil
                                               :must-match confirm))
  "List of login parameters needed to connect to DuckDB."
  :type 'sql-login-params
  :version "26.1")

(defun sql-comint-duckdb (product options &optional buf-name)
  "Create comint buffer and connect to DuckDB."
  ;; Put all parameters to the program (if defined) in a list and call
  ;; make-comint.
  (let ((params
         (append options
                 (if (not (string= "" sql-database))
                     `(,(expand-file-name sql-database))))))
    (sql-comint product params buf-name)))

(defun sql-duckdb-completion-object (sqlbuf _schema)
  ;; FIXME: make duckdb-specific
  (sql-redirect-value sqlbuf ".tables" "\\sw\\(?:\\sw\\|\\s_\\)*" 0))

(add-to-list 'sql-product-alist
             '(duckdb
               :name "DuckDB"
               :free-software t
               :font-lock sql-mode-duckdb-font-lock-keywords
               :sqli-program sql-duckdb-program
               :sqli-options sql-duckdb-options
               :sqli-login sql-duckdb-login-params
               :sqli-comint-func sql-comint-duckdb
               :list-all ".tables"      ;; FIXME
               :list-table ".schema %s" ;; FIXME
               :completion-object sql-duckdb-completion-object
               :prompt-regexp "^D "
               :prompt-length 2
               :prompt-cont-regexp "^· "))

(defun sql-duckdb (&optional buffer)
  "Run DuckDB as an inferior process.

DuckDB is free software.

If buffer `*SQL*' exists but no process is running, make a new process.
If buffer exists and a process is running, just switch to buffer
`*SQL*'.

Interpreter used comes from variable `sql-duckdb-program'.  Login uses
the variables `sql-user', `sql-password', `sql-database', and
`sql-server' as defaults, if set.  Additional command line parameters
can be stored in the list `sql-duckdb-options'.

The buffer is put in SQL interactive mode, giving commands for sending
input.  See `sql-interactive-mode'.

To set the buffer name directly, use \\[universal-argument]
before \\[sql-duckdb].  Once session has started,
\\[sql-rename-buffer] can be called separately to rename the
buffer.

To specify a coding system for converting non-ASCII characters
in the input and output to the process, use \\[universal-coding-system-argument]
before \\[sql-duckdb].  You can also specify this with \\[set-buffer-process-coding-system]
in the SQL buffer, after you start the process.
The default comes from `process-coding-system-alist' and
`default-process-coding-system'.

\(Type \\[describe-mode] in the SQL buffer for a list of commands.)"
  (interactive "P")
  (sql-product-interactive 'duckdb buffer))

;; FIXME
(defvar sql-mode-duckdb-font-lock-keywords sql-mode-postgres-font-lock-keywords)

(provide 'sql-duckdb)

;;; flymake-eslint-local.el --- ESLint backend for Flymake -*- lexical-binding: t; -*-
;;
;; Author: Ryan Burrows <rhburrows@gmail.com>
;; Version: 0.1
;; Package-Requires: ((emacs "30.1"))
;; Keywords: languages, tools, lint
;;
;;; Commentary:
;;
;; I wrote this because I couldn't get the distributed flymake-eslint
;; to work the way I wanted. You probably want to use that as this is
;; not tested beyond my personal use cases.
;;
;; This auto-detects a local `node_modules/.bin/eslint` if present,
;; falls back to global `eslint`, and parses JSON output from ESLint.
;;
;;; Code:

(defvar flymake-eslint-local-extra-args nil
  "Extra command-line arguments to pass to ESLint in the Flymake backend.")

(defvar-local flymake-eslint-local--proc nil
  "The active ESLint Flymake process for the current buffer.")

(defun flymake-eslint-local--eslint-executable ()
  "Return the ESLint executable to use for the current buffer."
  (or (and (boundp 'flymake-eslint-executable-name)
           flymake-eslint-executable-name)
      (let* ((root (locate-dominating-file (or (file-truename (buffer-file-name)) default-directory)
                                           "node_modules"))
             (local-eslint (and root
                                (file-truename (expand-file-name "node_modules/.bin/eslint" root)))))
        (and local-eslint (file-executable-p local-eslint) local-eslint))
      "eslint"))

(defun flymake-eslint-local--project-root ()
  "Find the project root directory for ESLint."
  (or (when-let ((proj (project-current)))
        (project-root proj))
      (locate-dominating-file default-directory "package.json")
      default-directory))

(defun flymake-eslint-local--parse-diagnostics (source)
  (goto-char (point-min))
  (let ((diags '()))
    (condition-case err
        (let ((results (json-parse-buffer :object-type 'alist :array-type 'list)))
          (dolist (file-result results)
            (dolist (msg (alist-get 'messages file-result))
              (let* ((line (alist-get 'line msg))
                     (column (alist-get 'column msg))
                     (end-line (alist-get 'endLine msg))
                     (end-column (alist-get 'endColumn msg))
                     (message (alist-get 'message msg))
                     (severity (alist-get 'severity msg))
                     (type (pcase severity
                             (2 :error)
                             (1 :warning)
                             (_ :note))))
                (when (and (numberp line) (numberp column))
                  (let* ((beg-pos (flymake-diag-region source line column))
                         (end-pos (when (and (numberp end-line) (numberp end-column))
                                    (flymake-diag-region source end-line end-column)))
                         (beg (car beg-pos))
                         (end (or (car end-pos) (cdr beg-pos))))
                    (when (and (integer-or-marker-p beg)
                               (integer-or-marker-p end))
                      (push (flymake-make-diagnostic source beg end type message)
                            diags))))))))
      (error
       (flymake-log :error "JSON parse error: %s" err)))
    diags))

(defun flymake-eslint-local--flymake (report-fn &rest _args)
  (let* ((source (current-buffer))
         (eslint (flymake-eslint-local--eslint-executable))
         (args (append '("--format" "json")
                       flymake-eslint-local-extra-args
                       (list (file-truename (buffer-file-name)))))
         (default-directory (file-truename (flymake-eslint-local--project-root))))
    (unless (executable-find eslint)
      (error "Cannot find eslint"))

    (when (process-live-p flymake-eslint-local--proc)
      (kill-process flymake-eslint-local--proc))

    (save-restriction
      (widen)

      (setq flymake-eslint-local--proc
            (make-process
             :name "eslint-flymake"
             :buffer (generate-new-buffer "*flymake-eslint-local*")
             :command (cons eslint args)
             :noquery t
             :sentinel
             (lambda (proc _event)
               (when (memq (process-status proc) '(exit signal))
                 (unwind-protect
                     (if (with-current-buffer source (eq proc flymake-eslint-local--proc))
                         (with-current-buffer (process-buffer proc)
                           (let ((diags (flymake-eslint-local--parse-diagnostics source)))
                             (funcall report-fn diags)))
                       )
                   (kill-buffer (process-buffer proc))))))))))

(defun flymake-eslint-local-setup ()
  (add-hook 'flymake-diagnostic-functions 'flymake-eslint-local--flymake nil t))

(provide 'flymake-eslint-local)

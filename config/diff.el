;; -*- lexical-binding: t; -*-

(use-package ediff
  :custom
  (ediff-window-setup-function 'ediff-setup-windows-plain)
  (ediff-split-window-function 'split-window-horizontally)
  (ediff-keep-variants nil)

  :config
  (defun rhb/apply-ediff-faces (&rest _)
    "Match the ediff faces to the current Catppuccin flavor.

The Catppuccin theme does not style ediff, so this reuses its palette
so ediff regions look like the rest of the diff faces and stay readable
after a flavor switch."
    (when (fboundp 'catppuccin-get-color)
      (let* ((red    (catppuccin-get-color 'red))
             (green  (catppuccin-get-color 'green))
             (blue   (catppuccin-get-color 'blue))
             (yellow (catppuccin-get-color 'yellow))
             (specs
              `((ediff-current-diff-A        . ,(catppuccin-recolor red 55))
                (ediff-current-diff-B        . ,(catppuccin-recolor green 55))
                (ediff-current-diff-C        . ,(catppuccin-recolor blue 55))
                (ediff-current-diff-Ancestor . ,(catppuccin-recolor yellow 55))
                (ediff-fine-diff-A           . ,(catppuccin-recolor red 30))
                (ediff-fine-diff-B           . ,(catppuccin-recolor green 30))
                (ediff-fine-diff-C           . ,(catppuccin-recolor blue 30))
                (ediff-fine-diff-Ancestor    . ,(catppuccin-recolor yellow 30))
                (ediff-even-diff-A           . ,(catppuccin-recolor red 72))
                (ediff-even-diff-B           . ,(catppuccin-recolor green 72))
                (ediff-even-diff-C           . ,(catppuccin-recolor blue 72))
                (ediff-even-diff-Ancestor    . ,(catppuccin-recolor yellow 72))
                (ediff-odd-diff-A            . ,(catppuccin-recolor red 78))
                (ediff-odd-diff-B            . ,(catppuccin-recolor green 78))
                (ediff-odd-diff-C            . ,(catppuccin-recolor blue 78))
                (ediff-odd-diff-Ancestor     . ,(catppuccin-recolor yellow 78)))))
        (dolist (spec specs)
          (set-face-attribute (car spec) nil
                              :background (cdr spec)
                              :foreground 'unspecified
                              :extend t)))))

  (with-eval-after-load 'catppuccin-theme
    (rhb/apply-ediff-faces)
    (advice-add 'catppuccin-reload :after #'rhb/apply-ediff-faces)))

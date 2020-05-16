(use-package pianobar
  :if (executable-find "pianobar")
  :ensure t
  :init
  (defun rhb-pianobar-play-start-pause-dwim ()
    (interactive)
    (if (or (not (fboundp 'pianobar-play-or-pause))
            (not (comint-check-proc pianobar-buffer)))
        (pianobar)
      (pianobar-play-or-pause)))
  :bind
  ("<f7>" . rhb-pianobar-play-start-pause-dwim)
  ("<f8>" . pianobar-next-song)
  
  :config
  (setq pianobar-username "rhburrows@gmail.com")
  (setq pianobar-station "6"))

(use-package w3m
  :if (executable-find "w3m")
  :ensure t
  :init
  (defun rhb-w3m-search (query)
    (interactive "MSearch Google: ")
    (let ((w3m-pop-up-windows t))
      (if (one-window-p) (split-window))
      (other-window 1)
      (w3m-search "google" query)))

  (defun rhb-w3m-open-current-page-in-system-browser ()
    (interactive)
    (browse-url w3m-current-url))
  
  :bind
  (("C-c g" . rhb-w3m-search)
   :map w3m-mode-map
   ("f" . rhb-w3m-open-current-page-in-system-browser)))

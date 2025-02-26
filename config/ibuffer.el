(use-package ibuffer
  :config
  (global-set-key (kbd "C-x C-b") 'ibuffer)

  :custom
  (ibuffer-expert t)
  (ibuffer-default-sorting-mode 'recency)
  (ibuffer-show-empty-filter-groups nil))

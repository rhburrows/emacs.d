(defadvice rspec-toggle-spec-and-target (after set-mode-on-target () activate)
  "Make sure the resulting buffer is in rspec mode if we switched there from rspec-mode"
  (rspec-mode t))

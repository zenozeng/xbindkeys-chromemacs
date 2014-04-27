(define-key "chromemacs-ido-tab"
  '(control s)
  (lambda () (press "Control+Tab")))

(define-key "chromemacs-ido-tab"
  '(control r)
  (lambda () (press "Control+Shift+Tab")))

(define-key "chromemacs-ido-tab"
  '(control g)
  (lambda () (chromemacs-keymap 'set "chromemacs-basic")))

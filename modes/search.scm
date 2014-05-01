(define-key "chromemacs-search"
  '(control s)
  (lambda () (press "F3")))

(define-key "chromemacs-search"
  '(control r)
  (lambda () (press "Shift+F3")))

(define-key "chromemacs-search"
  '(control g)
  (lambda ()
    (press "Escape")
    (chromemacs-keymap 'set "chromemacs-basic")))

(define-key "chromemacs-search"
  '(Escape)
  (lambda ()
    (press "Escape")
    (chromemacs-keymap 'set "chromemacs-basic")))

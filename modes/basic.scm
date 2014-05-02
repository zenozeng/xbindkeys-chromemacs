(map (lambda (keymap)
       (define-key "chromemacs-basic"
         (car keymap)
         (lambda ()
           (press (car (cdr keymap))))))
     (list (list '(control n) "Down")
           (list '(control p) "Up")
           (list '(control f) "Right")
           (list '(control b) "Left")
           (list '(control a) "Home")
           (list '(control e) "End")
           (list '(control v) "Next") ; PgDn
           (list '(control d) "Delete")
           (list '(alt d) "Control+Delete")
           (list '(alt v) "Prior") ; PgUp
           (list '(alt f) "Control+Right") ; forward-char
           (list '(alt b) "Control+Left")  ; backward-char
           (list '(control g) "Escape")
           (list '(control w) "Control+x")
           (list '(alt w) "Control+c")
           (list '(control y) "Control+v")
           (list '(control slash) "Control+z")))

;; Kill line
(define-key "chromemacs-basic"
  '(control k)
  (lambda () (press (list "Shift+End"
                          "Delete"))))

;; Enter Search Mode
(map (lambda (key)
       (define-key "chromemacs-basic" key
         (lambda ()
           (press "F3")
           (chromemacs-keymap 'set "chromemacs-search"))))
     (list '(control r) '(control s)))

;; Enter C-x Mode
(define-key "chromemacs-basic" '(control x)
  (lambda () (chromemacs-keymap 'set "chromemacs-control-x")))

;; Enter set-mark Mode
(define-key "chromemacs-basic" chromemacs-set-mark-key
  (lambda () (chromemacs-keymap 'set "chromemacs-set-mark")))

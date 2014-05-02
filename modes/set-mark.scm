(map (lambda (keybinding)
       (define-key "chromemacs-set-mark"
         (first keybinding)
         (lambda ()
           (press (second keybinding)))))
     (list (list '(control n) "Shift+Down")
           (list '(control p) "Shift+Up")
           (list '(control f) "Shift+Right")
           (list '(control b) "Shift+Left")
           (list '(control a) "Shift+Home")
           (list '(control e) "Shift+End")
           (list '(control v) "Shift+Next") ; PgDn
           (list '(alt v) "Shift+Prior") ; PgUp
           (list '(alt f) "Shift+Control+Right") ; forward-char
           (list '(alt b) "Shift+Control+Left")  ; backward-char
           (list '(control slash) "Control+z")))


(define-key "chromemacs-set-mark"
  '(control w)
  (lambda ()
    (press "Control+x")
    (chromemacs-keymap 'set "chromemacs-basic")))

(define-key "chromemacs-set-mark"
  '(alt w)
  (lambda ()
    (press "Control+c")
    (chromemacs-keymap 'set "chromemacs-basic")))

(define-key "chromemacs-set-mark"
  '(control y)
  (lambda ()
    (press "Control+v")
    (chromemacs-keymap 'set "chromemacs-basic")))

(define-key "chromemacs-set-mark"
  '(control g)
  (lambda ()
    (press "Right")
    (chromemacs-keymap 'set "chromemacs-basic")))

(define chromemacs-set-mark-key-modifiers
  (map (lambda (key)
         (cond
          [(equal? 'control key) "control"]
          [(equal? 'shift key) "shift"]
          [(equal? 'alt key) "alt"]))
       (filter (lambda (key)
                 (or (equal? 'control key)
                     (equal? 'shift key)
                     (equal? 'alt key)))
               chromemacs-set-mark-key)))

(define-key "chromemacs-set-mark"
  chromemacs-set-mark-key
  (lambda ()
    (keyup chromemacs-set-mark-key-modifiers)
    (chromemacs-keymap 'set-async "chromemacs-basic")))

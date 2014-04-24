(define (press key)
  "Ungrab all keys and press key using xdotool, then grab all keys"
  (ungrab-all-keys)
  (run-command (string-append "xdotool getwindowfocus key --clearmodifiers " key))
  (grab-all-keys))

(define last-key
  (let ((last-key-value 0))
    (lambda (operation . values)
      (case operation
        ((set) (set! last-key-value (car values)))
        ((get) last-key-value)))))

(define (bind-key key func)
  (xbindkey-function key
                     (lambda ()
                       (func)
                       (last-key 'set key))))

(define (bind-keys key1 key2 func-key1-key2 func-key2)
  "bind keys"
  (xbindkey-function key1 (lambda ()
                            (last-key 'set key1)))
  (xbindkey-function key2 (lambda ()
                            (if (equal? key1 (last-key 'get))
                                (func-key1-key2)
                                (func-key2))
                            (last-key 'set key2))))

;; New Tab for C-x C-f and Forward char for C-f
(bind-keys '(control x) '(control f)
           (lambda ()
             (press "Control+t"))
           (lambda ()
             (press "Right")))

;; C-x k to close tab
(bind-keys '(control x) '(k)
                   (lambda ()
                     (press "Control+w"))
                   (lambda () nil))

;; Emacs Recursively Search Support

(map (lambda (keymap)
       (bind-key (car keymap)
                 (lambda ()
                   (if (or (equal? '(control s) (last-key 'get))
                           (equal? '(control r) (last-key 'get)))
                       (press (car (cdr keymap)))
                       (press "Control+f")))))
     (list (list '(control s) "Return")
           (list '(control r) "Up")))

;; Basic Emacs Keybindings

(map (lambda (keymap)
       (bind-key (car keymap)
                 (lambda ()
                   (press (car (cdr keymap))))))
     (list (list '(control n) "Down")
           (list '(control p) "Up")
           (list '(control f) "Right")
           (list '(control b) "Left")
           (list '(control a) "Home")
           (list '(control e) "End")
           (list '(alt f) "Control+Right") ; forward-char
           (list '(alt b) "Control+Left") ; backward-char
           (list '(control g) "Escape")
           ;; kill / yank
           (list '(control w) "Control+x")
           (list '(control y) "Control+v")))

;; TODO: Meta + f => ctrl + left
;; TODO: control+k => shift+end, delete

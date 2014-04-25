;; TODO: pause 的 时候要把当前的 mode 记下来
;; TODO: C-x C-f to open urls

;; Global Vars

(use-modules ((ice-9 threads)))

(define mode #f)

(define (chromemacs)
  "Emacs Keybindings for Chrome"

  (define (press key)
    "Ungrab all keys and press key using xdotool, then grab all keys"
    (ungrab-all-keys)
    (run-command (string-append "xdotool getwindowfocus key --clearmodifiers " key))
    (grab-all-keys))

  (define (basic-mode)
    (reset-keys)

    ;; Basic Emacs Keybindings
    (map (lambda (keymap)
           (xbindkey-function (car keymap)
                              (lambda ()

                                (press (car (cdr keymap))))))
         (list (list '(control n) "Down")
               (list '(control p) "Up")
               (list '(control f) "Right")
               (list '(control b) "Left")
               (list '(control a) "Home")
               (list '(control e) "End")
               (list '(alt f) "Control+Right") ; forward-char
               (list '(alt b) "Control+Left")  ; backward-char
               (list '(control g) "Escape")
               (list '(control w) "Control+x")
               (list '(alt w) "Control+c")
               (list '(control y) "Control+v")))

    (xbindkey-function '(control k)
                       (lambda ()
                         (press "Shift+End key --clearmodifiers Delete")))

    ;; Search
    (map (lambda (keybinding)
           (xbindkey-function keybinding
                              (lambda ()
                                (press "F3")
                                (search-mode))))
         (list '(control r) '(control s)))

    ;; C-x Mode
    (xbindkey-function '(control x) (lambda () (control-x-mode)))

 
    (grab-all-keys))

  ;; Bindings for C-x k, C-x C-c ...
  (define (control-x-mode)
    (reset-keys)
    (xbindkey-function 'k
                       (lambda ()
                         (press "Control+w")
                         (basic-mode)))
    (xbindkey-function 'r
                       (lambda ()
                         (press "F5")
                         (basic-mode)))
    (xbindkey-function 'h
                       (lambda ()
                         (press "Control+a")
                         (basic-mode)))
    (xbindkey-function '(control c)
                       (lambda ()
                         (press "Control+Shift+w")
                         (basic-mode)))
    (xbindkey-function '(control g)
                       (lambda () (basic-mode)))
    (grab-all-keys))

  ;; Bindings for Recursively Search

  (define (search-mode)
    (reset-keys)
    (xbindkey-function '(control s)
                       (lambda ()
                         (press "F3")))
    (xbindkey-function '(control r)
                       (lambda ()
                         (press "Shift+F3")))
    (xbindkey-function '(control g)
                       (lambda ()
                         (press "Escape")
                         (basic-mode)))
    (grab-all-keys))

  (add-hook! receive-message-hook
             (lambda (msg)
               (display msg)
               (if (equal? msg "chromemacs::start")
                   (begin
                     (basic-mode)))
               (if (equal? msg "chromemacs::stop")
                   (begin
                     (reset-keys)))))

  (begin-thread
   (system "~/.dotxbindkeys/bin/chromemacs-daemon"))
  
  )

(chromemacs)



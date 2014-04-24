;; TODO: pause 的 时候要把当前的 mode 记下来
;; TODO: C-x C-f to open urls

(use-modules (ice-9 popen) (ice-9 rdelim) (ice-9 threads))

(define (chromemacs)
  "Emacs Keybindings for Chrome"

  (define (set-timeout ms callback)
    (define main-thread (current-thread))
    (display main-thread)
    (display "set-timeout")
    (begin-thread
     (usleep (* 1000 ms))
     (display "sleep done")
     (system-async-mark callback main-thread)))

  (define (set-interval ms callback)
    (define interval-callback
      (lambda ()
        (display "callback execed")
        (callback)
        (set-timeout ms interval-callback)))
    (set-timeout ms interval-callback))

  (define (press key)
    "Ungrab all keys and press key using xdotool, then grab all keys"
    (ungrab-all-keys)
    (run-command (string-append "xdotool getwindowfocus key --clearmodifiers " key))
    (grab-all-keys))

  (define (reset-keys)
    ;; TODO: add global hook
    (ungrab-all-keys)
    (remove-all-keys))

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
               (list '(alt b) "Control+Left") ; backward-char
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
    (display "chromemacs::search-mode\n")
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


  (define (start)
    (basic-mode)
    (display "chromemacs::start\n"))

  (define (stop)
    (reset-keys)
    (display "chromemacs::stop\n"))

  (let ((status #f))
    (set-interval 500
                  (lambda ()
                    (define pipe (open-input-pipe "xprop -id `xdotool getwindowfocus` WM_CLASS"))
                    (define wm-class (read-line pipe))
                    (close-pipe pipe)
                    (if (not (eqv?
                              status
                              (not (not (string-contains wm-class "google-chrome"))) ; force to bool
                              ))
                        (begin
                          (set! status (not status))
                          (if status (start) (stop))))))))

(chromemacs)

(sleep 1)

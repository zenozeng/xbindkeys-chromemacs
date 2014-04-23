(define (press key)
  "Ungrab all keys and press key using xdotool, then grab all keys"
  (ungrab-all-keys)
  (run-command (string-append "xdotool getwindowfocus key --clearmodifiers " key))
  (grab-all-keys))

(xbindkey-function '(control n)
                   (lambda ()
                     (press "Down")))

(xbindkey-function '(control p)
                   (lambda ()
                     (press "Up")))

(xbindkey-function '(control f)
                   (lambda ()
                     (press "Right")))

(xbindkey-function '(control b)
                   (lambda ()
                     (press "Left")))

(xbindkey-function '(control a)
                   (lambda ()
                     (press "Home")))

(xbindkey-function '(control e)
                   (lambda ()
                     (press "End")))

(xbindkey-function '(control s)
                   (lambda ()
                     (press "Control+f")))

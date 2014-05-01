(use-modules ((ice-9 threads)))

(define chromemacs-keymap
  (let ((current-keymap "chromemacs-basic"))
    (lambda (operation . values)
      (case operation
        ((set)
         (begin
           (set! current-keymap (car values))
           (set-keymap current-keymap)))
        ((set-async)
         (begin
           (set! current-keymap (car values))
           (set-keymap-async (car values))))
        ((get) current-keymap)))))

(load "basic.scm")
(load "control-x.scm")
(load "ido-tab.scm")
(load "search.scm")
(load "set-mark.scm")

(add-hook! receive-message-hook
           (lambda (msg)
             (if (equal? msg "chromemacs::start")
                 (chromemacs-keymap 'set (chromemacs-keymap 'get)))
             (if (equal? msg "chromemacs::stop")
                 (set-keymap "global"))))

(begin-thread
 (system "~/.dotxbindkeys/plugins/chromemacs/chromemacs-daemon"))

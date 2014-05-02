(use-modules ((ice-9 threads)))

;;; Load Config

(define chromemacs-set-mark-key '(control space))
(load "config.scm")

;;; Load keymaps

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

(load "modes/basic.scm")
(load "modes/control-x.scm")
(load "modes/ido-tab.scm")
(load "modes/search.scm")
(load "modes/set-mark.scm")

;;; Start Daemon

(add-hook! receive-message-hook
           (lambda (msg)
             (if (equal? msg "chromemacs::start")
                 (chromemacs-keymap 'set (chromemacs-keymap 'get)))
             (if (equal? msg "chromemacs::stop")
                 (set-keymap "global"))))

(begin-thread
 (system "~/.dotxbindkeys/plugins/chromemacs/chromemacs-daemon"))

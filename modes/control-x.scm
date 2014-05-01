(map (lambda (keybinding)
       (define-key "chromemacs-control-x" (first keybinding) (second keybinding)))
     (list (list 'k
                 (lambda ()
                   (press "Control+w")
                   (chromemacs-keymap 'set "chromemacs-basic")))
           (list 'r
                 (lambda ()
                   (press "Control+Shift+t")
                   (chromemacs-keymap 'set "chromemacs-basic")))
           (list 'b
                 (lambda ()
                   (chromemacs-keymap 'set "chromemacs-ido-tab")))
           (list 'h
                 (lambda ()
                   (press "Control+a")
                   (chromemacs-keymap 'set "chromemacs-basic")))
           (list '(control c)
                 (lambda ()
                   (press "Control+Shift+w")
                   (chromemacs-keymap 'set "chromemacs-basic")))
           (list '(control g)
                 (lambda ()
                   (chromemacs-keymap 'set "chromemacs-basic")))))

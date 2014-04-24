ps aux | grep xbindkeys | awk '{print $2}' | xargs kill -9
xbindkeys -v -fg chromemacs.scm

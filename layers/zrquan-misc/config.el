;;; config.el --- Treemacs Layer configuration File for Spacemacs


(spacemacs|do-after-display-system-init
 (define-fringe-bitmap 'right-curly-arrow
   [0 0 0 0 120 8 8 8])

 (define-fringe-bitmap 'left-curly-arrow
   [16 16 16 30 0 0 0 0])

 (define-fringe-bitmap 'right-arrow
   [0 4 6 91 91 6 4 0])

 (define-fringe-bitmap 'left-arrow
   [0 32 96 218 218 96 32 0])

 (zrquan/set-chinese-font "楷体" 22)
 ;; support emoji, only work for emacs27+
 (set-fontset-font t 'symbol "Segoe UI Emoji" nil 'append)
 )

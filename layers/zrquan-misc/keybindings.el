;; -*- mode: emacs-lisp -*-

(spacemacs/set-leader-keys
  "xO" 'link-hint-open-link-at-point
  "xo" 'link-hint-open-link)

;; chinese layer keybindings
(if (configuration-layer/layer-usedp 'chinese)
    (progn
      (spacemacs/set-leader-keys "oy" 'youdao-dictionary-search-at-point-posframe)
      (spacemacs/set-leader-keys "oi" 'youdao-dictionary-search-from-input)))

(spacemacs/set-leader-keys
  "or" 'ranger
  "og" 'go-translate
  "ob" 'bookmark-bmenu-list)

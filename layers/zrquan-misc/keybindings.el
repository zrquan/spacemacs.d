;; -*- mode: emacs-lisp -*-

;; chinese layer keybindings
(if (configuration-layer/layer-usedp 'chinese)
    (progn
      (spacemacs/set-leader-keys "oy" 'youdao-dictionary-search-at-point-tooltip)
      (spacemacs/set-leader-keys "oi" 'youdao-dictionary-search-from-input)))

(spacemacs/set-leader-keys
  "or" 'ranger
  "of" 'org-roam-find-file
  "oh" 'eaf-open-browser-with-history
  "og" 'counsel-rg
  "oG" 'go-translate
  "oo" 'ibuffer

  "xO" 'link-hint-open-link-at-point
  "xo" 'link-hint-open-link)

(global-set-key (kbd "C-,") 'org-cycle-agenda-files)

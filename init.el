;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defconst linux?   (eq system-type 'gnu/linux)  "Are you on a linux system?")
(defconst windows? (eq system-type 'windows-nt) "Are you on windows system?")

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   dotspacemacs-configuration-layer-path '("~/.spacemacs.d/layers/")
   dotspacemacs-configuration-layers
   '((zrquan-misc        :location local)
     (zrquan-org         :location local)
     (zrquan-programming :location local))
   dotspacemacs-additional-packages
   '(rainbow-mode)
   dotspacemacs-excluded-packages
   '(rainbow-delimiters google-translate helm-make
     evil-tutor org-present orgit org-projectile org-brain)
   ))

(defun dotspacemacs/init ()
  "Instantiate Spacemacs core settings.
All `dotspacemacs-' variables with values set different than their defaults.
They are all defined in `~/.emacs.d/core/core-dotspacemacs.el'.
Check `dotspacemacs/get-variable-string-list' for all vars you can configure."
  (setq-default
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-themes '((apropospriate-dark :location
                                             (recipe :fetcher github
                                                     :repo "zrquan/apropospriate-theme"))
                         (apropospriate-light :location
                                             (recipe :fetcher github
                                                     :repo "zrquan/apropospriate-theme")))
   dotspacemacs-mode-line-theme 'doom
   dotspacemacs-line-numbers t
   ;; correctly invoke `spacemacs//set-monospaced-font'
   dotspacemacs-default-font '("Jetbrains Mono"
                               :size 20)
   dotspacemacs-active-transparency   95
   dotspacemacs-inactive-transparency 70
   dotspacemacs-enable-server         linux?
   dotspacemacs-persistent-server     linux?
   ;; important!
   dotspacemacs-elpa-subdirectory nil
   ;; pass `dotspacemacs/test-dotfile'
   dotspacemacs-editing-style     'vim
   dotspacemacs-leader-key        "SPC"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-emacs-leader-key  "M-m"
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (setq configuration-layer-elpa-archives
        '(("melpa-cn" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
          ("org-cn"   . "https://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
          ("gnu-cn"   . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")))
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  (blink-cursor-mode t)
  (setq treemacs-no-png-images t)
  (setq avy-timeout-seconds 0.3)
  (setq doom-modeline-env-enable-python nil)
  (setq company-emoji-insert-unicode nil)

  ;; EAF
  (use-package eaf
    :load-path "~/.emacs.d/private/local/emacs-application-framework"
    :init
    (use-package epc :defer t :ensure t)
    (use-package ctable :defer t :ensure t)
    (use-package deferred :defer t :ensure t)
    (use-package s :defer t :ensure t)
    :custom
    (eaf-browser-continue-where-left-off t)
    :config
    (setq eaf-fullscreen-p t)
    (eaf-setq eaf-browser-enable-adblocker "true")
    (eaf-setq eaf-browser-dark-mode "false")
    ;;(setq browse-url-browser-function 'eaf-open-browser)
    ;;(defalias 'browse-web #'eaf-open-browser)
    (eaf-bind-key nil "M-q" eaf-browser-keybinding)) ;; unbind, see more in the Wiki

  ;; eaf-evil
  (require 'eaf-evil)
  (setq eaf-evil-leader-keymap  spacemacs-cmds)
  (define-key key-translation-map (kbd "SPC")
    (lambda (prompt)
      (if (derived-mode-p 'eaf-mode)
          (pcase eaf--buffer-app-name
            ("browser" (if (string= (eaf-call-sync "call_function" eaf--buffer-id "is_focus") "True")
                           (kbd "SPC")
                         (kbd eaf-evil-leader-key)))
            ("pdf-viewer" (kbd eaf-evil-leader-key))
            ("image-viewer" (kbd eaf-evil-leader-key))
            (_  (kbd "SPC")))
        (kbd "SPC"))))

  ;; 仅在第一次打开frame时执行
  (spacemacs|do-after-display-system-init
   ;;(spacemacs//set-monospaced-font "Jetbrains Mono" "楷体" 18 22)
   (setq doom-modeline-modal-icon nil)
   (setq doom-modeline-buffer-state-icon nil)
   (spacemacs/toggle-vi-tilde-fringe-off)
   (spacemacs/load-spacemacs-env)
   )
  )

;; load custom.el
(setq custom-file (expand-file-name "custom.el" dotspacemacs-directory))
(load custom-file 'no-error 'no-message)

;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   dotspacemacs-configuration-layer-path '("~/.spacemacs.d/layers/")
   dotspacemacs-configuration-layers
   '(rust
     ;; my layers
     zrquan-misc
     zrquan-org

     ;; core
     (git :variables
           magit-push-always-verify nil
           magit-save-repository-buffers 'dontask
           magit-revert-buffers 'silent
           magit-refs-show-commit-count 'all)
     (version-control :variables
                      version-control-diff-tool 'git-gutter)
     ivy
     shell
     better-defaults
     (auto-completion :variables
                       auto-completion-enable-snippets-in-popup t
                       auto-completion-use-company-box t
                       auto-completion-enable-sort-by-usage t)
     (ranger :variables
             ranger-override-dired 'deer
             ranger-show-preview t)
     (org :variables
           org-enable-hugo-support t
           org-enable-roam-support t
           org-enable-bootstrap-support t
           org-enable-reveal-js-support t
           org-enable-org-journal-support t)

     ;; programming
     lsp
     (syntax-checking :variables
                       syntax-checking-use-original-bitmaps t)
     emacs-lisp
     (python :variables
             python-backend 'lsp python-lsp-server 'pyright)
     (javascript :variables javascript-backend 'lsp)
     html

     ;; optional
     ibuffer
     prodigy
     csv
     unicode-fonts
     (chinese :variables
               chinese-enable-youdao-dict t)
     (plantuml :variables
               plantuml-jar-path "~/.spacemacs.d/opt/plantuml.jar"
               org-plantuml-jar-path "~/.spacemacs.d/opt/plantuml.jar")
     )
   dotspacemacs-additional-packages '(rainbow-mode)
   dotspacemacs-excluded-packages
   '(rainbow-delimiters google-translate
     evil-tutor evil-ediff evil-lion
     company-statistics company-anaconda helm-make
     spacemacs-theme org-present orgit
     org-projectile org-brain)
   ))

(defun dotspacemacs/init ()
  "Instantiate Spacemacs core settings.
All `dotspacemacs-' variables with values set different than their defaults.
They are all defined in `~/.emacs.d/core/core-dotspacemacs.el'.
Check `dotspacemacs/get-variable-string-list' for all vars you can configure."
  (setq-default
   dotspacemacs-startup-banner 'random
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-themes '((apropospriate-dark :location
                                             (recipe :fetcher github
                                                     :repo "zrquan/apropospriate-theme"))
                         (apropospriate-light :location
                                             (recipe :fetcher github
                                                     :repo "zrquan/apropospriate-theme")))
   dotspacemacs-mode-line-theme 'doom
   ;; correctly invoke `spacemacs//set-monospaced-font'
   dotspacemacs-default-font nil
   dotspacemacs-enable-server t
   dotspacemacs-persistent-server t
   ;; important!
   dotspacemacs-elpa-subdirectory nil
   ;; pass `dotspacemacs/test-dotfile'
   dotspacemacs-editing-style 'vim
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-emacs-leader-key "M-m"
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
  (setq org-extend-today-until 6)
  ;; src block indentation / editing / syntax highlighting
  (setq org-src-fontify-natively t
        org-src-window-setup 'current-window ;; edit in current window
        org-src-strip-leading-and-trailing-blank-lines t
        org-src-preserve-indentation t ;; do not put two spaces on the left
        org-src-tab-acts-natively t)

  (setq treemacs-no-png-images t)
  (setq warning-minimum-level :error)

  ;; EAF
  (use-package eaf
    :load-path "~/.emacs.d/elpa/emacs-application-framework" ; Set to "/usr/share/emacs/site-lisp/eaf" if installed from AUR
    :init
    (use-package epc :defer t :ensure t)
    (use-package ctable :defer t :ensure t)
    (use-package deferred :defer t :ensure t)
    (use-package s :defer t :ensure t)
    :custom
    (eaf-browser-continue-where-left-off t)
    :config
    (eaf-setq eaf-browser-enable-adblocker "true")
    (eaf-setq eaf-browser-dark-mode "false")
    (setq browse-url-browser-function 'eaf-open-browser)
    (defalias 'browse-web #'eaf-open-browser)
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
   (spacemacs//set-monospaced-font "Jetbrains Mono" "楷体" 20 24)
   ;; support emoji, only work for emacs27+
   (set-fontset-font t 'symbol "Segoe UI Emoji" nil 'append)
   (setq doom-modeline-modal-icon nil)
   (setq org-startup-with-inline-images nil)
   (spacemacs/toggle-vi-tilde-fringe-off)
   (spacemacs/load-spacemacs-env)
   )
  )

;; load custom.el
(setq custom-file (expand-file-name "custom.el" dotspacemacs-directory))
(load custom-file 'no-error 'no-message)

;;; -*- lexical-binding: t; -*-

(configuration-layer/declare-layers
 '(;; core
   git
   shell
   (syntax-checking :variables
                    syntax-checking-use-original-bitmaps t)
   better-defaults
   (auto-completion :variables
                    auto-completion-tab-key-behavior 'complete
                    auto-completion-enable-snippets-in-popup t
                    auto-completion-enable-sort-by-usage t)
   (ivy :variables
        ivy-enable-advanced-buffer-information t)
   (ranger :variables
           ranger-override-dired 'deer
           ranger-show-preview t)
   (org :variables
        org-enable-hugo-support t
        org-enable-sticky-header t
        org-enable-bootstrap-support t
        org-enable-reveal-js-support t
        org-enable-org-journal-support t)

   ;; programming
   lsp
   emacs-lisp
   (python :variables
           python-backend 'lsp python-lsp-server 'pyright)
   html
   solidity

   ;; optional
   csv
   unicode-fonts
   (chinese :variables
            chinese-enable-youdao-dict t)
   (plantuml :variables
             plantuml-jar-path "~/.spacemacs.d/opt/plantuml.jar"
             org-plantuml-jar-path "~/.spacemacs.d/opt/plantuml.jar")
   ))

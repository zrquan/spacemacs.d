;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-undo-system 'undo-tree)
 '(evil-want-Y-yank-to-eol nil)
 '(hl-todo-keyword-faces
   '(("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#4f97d7")
     ("OKAY" . "#4f97d7")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#86dc2f")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX+" . "#dc752f")
     ("\\?\\?\\?+" . "#dc752f")))
 '(linum-format "%3i")
 '(org-agenda-files
   '("c:/Users/26299/org/gtd/inbox.org" "c:/Users/26299/org/gtd/projects.org" "c:/Users/26299/org/gtd/tasks.org" "c:/Users/26299/blog/content/journal/20201201.org"))
 '(org-journal-dir "~/org/journal/" t)
 '(org-src-tab-acts-natively nil)
 '(package-selected-packages
   '(tide typescript-mode tern import-js grizzl helm-gtags ggtags counsel-gtags add-node-modules-path typit mmt sudoku pacmacs 2048-game cfrs org-pandoc-import apropospriate-theme company-posframe emoji-fontset ivy-emoji verb csv-mode nyan-mode org-id-cleanup persist ox-hugo org-drill ox-twbs org-sticky-header org-re-reveal org-journal emacsql-sqlite3 emacsql web-mode tagedit slim-mode scss-mode sass-mode pug-mode impatient-mode haml-mode emmet-mode counsel-css company-web web-completion-data ligature solidity-flycheck solidity-mode doom-modeline ox-reveal pyim pyim-basedict xr pangu-spacing find-by-pinyin-dired chinese-conv ace-pinyin pinyinlib rainbow-mode apropospriate org-roam go-translate evil-vimish-fold vimish-fold elfeed-web elfeed-org elfeed-goodies ace-jump-mode noflet elfeed ivy-rich unicode-fonts ucs-utils font-utils persistent-soft ivy-posframe prettier-js nodejs-repl json-navigator hierarchy wgrep smex lsp-ivy ivy-yasnippet ivy-xref ivy-purpose ivy-hydra ivy-avy counsel-projectile counsel swiper mvn meghanada maven-test-mode lsp-java groovy-mode groovy-imports pcache lsp-ui lsp-python-ms lsp-pyright lsp-origami helm-lsp dap-mode posframe lsp-treemacs bui lsp-mode treemacs-all-the-icons nameless mmm-mode markdown-toc magit-svn magit-section importmagic epc ctable concurrent deferred helm-xref helm-purpose window-purpose imenu-list helm-org-rifle helm-org helm-ls-git helm-git-grep gitignore-templates gh-md flycheck-elsa evil-textobj-line evil-org evil-lion evil-goggles editorconfig devdocs centered-cursor-mode blacken hybrid-mode font-lock+ dotenv-mode shrink-path prettify-utils all-the-icons-ivy ivy all-the-icons-dired zenburn-theme zen-and-art-theme white-sand-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme rebecca-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme modus-vivendi-theme modus-operandi-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme kaolin-themes jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme farmhouse-theme eziam-theme exotica-theme espresso-theme dracula-theme doom-themes django-theme darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme chocolate-theme autothemer cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme yasnippet-snippets writeroom-mode visual-fill-column treemacs-projectile treemacs-persp treemacs-magit treemacs-icons-dired treemacs-evil treemacs pfuture terminal-here symon symbol-overlay string-inflection sphinx-doc spaceline-all-the-icons all-the-icons memoize plantuml-mode pippel pipenv password-generator overseer org-superstar org-rich-yank org-cliplink org-brain flycheck-package evil-cleverparens emr clang-format list-utils markdown-mode org-super-agenda ts ht ranger emoji-cheat-sheet-plus company-emoji web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc coffee-mode origami graphviz-dot-mode company-quickhelp yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode dash-functional helm-pydoc cython-mode company-anaconda anaconda-mode pythonic youdao-dictionary names chinese-word-at-point unfill mwim flycheck-pos-tip pos-tip flycheck xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help smeargle orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download magit-gitflow magit-popup htmlize helm-gitignore helm-company helm-c-yasnippet gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link fuzzy evil-magit magit git-commit with-editor transient company-statistics company auto-yasnippet yasnippet ac-ispell auto-complete arc-dark-theme spaceline paradox hydra highlight-numbers helm-projectile projectile flx-ido evil-unimpaired f evil-search-highlight-persist evil-lisp-state ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org powerline restart-emacs request rainbow-delimiters pkg-info popwin persp-mode pcre2el spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide lv hungry-delete hl-todo highlight-parentheses parent-mode highlight-indentation helm-themes helm-swoop epl helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-tutor evil-surround highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu elisp-slime-nav dumb-jump dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async))
 '(paradox-github-token t)
 '(pdf-view-midnight-colors '("#b2b2b2" . "#292b2e"))
 '(plantuml-default-exec-mode 'jar)
 '(safe-local-variable-values
   '((eval when
           (require 'rainbow-mode nil t)
           (rainbow-mode 1))
     (javascript-backend . tide)
     (javascript-backend . tern)
     (javascript-backend . lsp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(breakpoint-disabled ((t (:background "IndianRed3" :foreground "IndianRed3"))))
 '(dap-ui-breakpoint-verified-fringe ((t (:background "sea green" :foreground "sea green" :weight bold))))
 '(fixed-pitch ((t (:family "JetBrains Mono"))))
 '(org-tag ((t (:foreground "#757575" :weight bold :height 0.8))))
 '(youdao-dictionary-posframe-tip-face ((t (:background "LemonChiffon2" :foreground "black")))))

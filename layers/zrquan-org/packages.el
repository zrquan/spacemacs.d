;;; packages.el --- zrquan-org layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author:  <4shen0ne@LAPTOP-LJ7ND4L6>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `zrquan-org-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `zrquan-org/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `zrquan-org/pre-init-PACKAGE' and/or
;;   `zrquan-org/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst zrquan-org-packages
  '(
    (org :location built-in)
    org-download
    org-journal
    org-drill
    ox-hugo
    org-super-agenda
    ))

(defun zrquan-org/post-init-org-journal ()
  (setq org-journal-dir "~/org/journal")
  (setq org-journal-file-format "%Y%m%d.org")
  (setq org-journal-file-type 'weekly))

(defun zrquan-org/post-init-ox-hugo ()
  (push "html" org-hugo-external-file-extensions-allowed-for-copying))

(defun zrquan-org/init-org-drill ()
  "背单词"
  (use-package org-drill
    :config
    (progn
      (add-to-list 'org-modules 'org-drill)
      (setq org-drill-add-random-noise-to-intervals-p t)
      (setq org-drill-hint-separator "||")
      (setq org-drill-left-cloze-delimiter "<[")
      (setq org-drill-right-cloze-delimiter "]>")
      (setq org-drill-learn-fraction 0.25)))
  )

(defun zrquan-org/post-init-org ()
  "Configuration of org mode"
  (with-eval-after-load 'org
    (progn
      (setq org-tags-column 0)
      (setq org-hide-emphasis-markers t)
      (setq indent-tabs-mode nil)
      (setq org-startup-with-inline-images nil)
      (setq org-startup-indented t)
      (setq org-agenda-files '("~/org/agenda/"))

      (setq org-capture-templates
            '(("i" "Inbox" entry
               (file "~/org/agenda/inbox.org")
               "* TODO %^{something}")
              ("p" "编程笔记" entry
               (file "~/org/brain/programing/captures.org")
               "* %^{headline}\n%?"
               :empty-lines-after 1
               :kill-buffer t)
              ("s" "安全笔记" entry
               (file "~/org/brain/security/captures.org")
               "* %^{headline}\n%?"
               :kill-buffer t)))

      (setq org-todo-keywords
            '((sequence "TODO(t)" "WAIT(w)" "SOMEDAY(s)" "|" "DONE(d!)" "CANCELED(c@/!)")))
      (setq org-superstar-headline-bullets-list '("¶" "◉" "○" "※"))

      (org-babel-do-load-languages
       'org-babel-load-languages
       '((emacs-lisp . t)
         (python . t)
         (eshell . t)
         (plantuml . t)))

      ;; keybindings
      (spacemacs/set-leader-keys-for-major-mode 'org-mode "or" 'org-redisplay-inline-images)
      )))

(defun zrquan-org/post-init-org-download ()
  "configurations of org-download package"
  (setq-default org-download-image-dir "~/org/images")
  (setq-default org-download-heading-lvl 0)
  (setq-default org-download-image-org-width 400)

  (evil-define-key 'insert org-mode-map
    (kbd "C-v") 'org-download-clipboard)
  )

(defun zrquan-org/init-org-super-agenda ()
  (use-package org-super-agenda
    :init
    (setq org-super-agenda-groups
          '((:name "Important"
                   :priority "A"
                   :tag "work")
            (:priority<= "B"
                  :scheduled future)))
    (add-hook 'org-agenda-mode-hook 'org-super-agenda-mode)
    ))

;;; packages.el ends here

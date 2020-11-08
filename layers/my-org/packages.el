;;; packages.el --- my-org layer packages file for Spacemacs.
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
;; added to `my-org-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `my-org/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `my-org/pre-init-PACKAGE' and/or
;;   `my-org/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst my-org-packages
  '(
    org
    org-present
    org-download
    org-super-agenda
    (org-projectile :excluded t)
    ))

(defun my-org/pre-init-org ()
  (setq org-agenda-files '("~/gtd.org"))
  (setq org-agenda-custom-commands
        '(
          ("w" . "任务安排")
          ("wa" "重要且紧急的任务" tags-todo "+PRIORITY=\"A\"")
          ("wb" "重要但不紧急的任务" tags-todo "-weekly-monthly-daily+PRIORITY=\"B\"")
          ("wc" "不重要且不紧急的任务" tags-todo "+PRIORITY=\"C\"")
          ("W" "Weekly Review"
           ((stuck "") ;; review stuck projects as designated by org-stuck-projects
            (tags-todo "work")
            (tags-todo "study")
            (tags-todo "life")
            (tags-todo "daily")
            (tags-todo "weekly")
            ))
          ))

  (setq org-capture-templates
        '(("i" "Inbox" entry (file+headline "~/gtd.org" "Inbox")
           "* TODO %?\n %i\n")
          ("n" "Quick Note" entry (file "~/Documents/notes/quick-notes.org")
           "* %?\n %x\n")))

  (setq org-todo-keywords
        '((sequence "TODO(t)" "WAIT(w)" "SOMEDAY(s)" "|" "DONE(d!)" "CANCELED(c@/!)")))
  (setq org-superstar-headline-bullets-list '("¶" "◉" "○" "§")))

(defun my-org/post-init-org ()
  "Configuration of org mode"
  (setq org-hide-emphasis-markers t)
  (setq org-startup-indented t)
  (setq indent-tabs-mode nil)
  (setq default-tab-width 4)
  (setq org-image-actual-width '(750))
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "n" 'org-toggle-narrow-to-subtree)
  (add-hook 'org-mode-hook 'spacemacs/toggle-auto-fill-mode-on))

(defun my-org/post-init-org-present ()
  (setq org-present-text-scale 3)

  (defun my-org//org-present-start ()
    "Initiate `org-present' mode"
    (org-present-big)
    (org-present-hide-cursor)
    (org-present-read-only)
    (spacemacs/toggle-mode-line-off)
    (evil-define-key 'normal org-present-mode-keymap
      "h"             'org-present-prev
      (kbd "<left>")  'org-present-prev
      "l"             'org-present-next
      (kbd "<right>") 'org-present-next
      "q"             'org-present-quit)
    ;; evil-normal-state seems to be required to load the above key bindings
    (evil-normal-state))

  (defun my-org//org-present-end ()
    "Terminate `org-present' mode"
    (org-present-small)
    (org-present-show-cursor)
    (org-present-read-write)
    (spacemacs/toggle-mode-line-on)
    (if (not org-startup-with-inline-images)
        (org-remove-inline-images)))

  (remove-hook 'org-present-mode-hook 'spacemacs//org-present-start)
  (remove-hook 'org-present-mode-quit-hook 'spacemacs//org-present-end)
  (add-hook 'org-present-mode-hook 'my-org//org-present-start)
  (add-hook 'org-present-mode-quit-hook 'my-org//org-present-end))

(defun my-org/post-init-org-download ()
  "configurations of org-download package"
  ;; (setq-default org-download-image-dir "~/Pictures/org-download")
  ;; (setq-default org-download-heading-lvl nil)
  ;; (setq-default org-download-abbreviate-filename-function 'expand-file-name)
  (setq org-download-method 'attach)
  )

(defun my-org/init-org-super-agenda ()
  (use-package org-super-agenda
    :init
    (setq org-super-agenda-groups
          '((:name "Important"
                  :priority "A")
            (:priority<= "B"
                  :scheduled future)))
    (add-hook 'org-mode-hook 'org-super-agenda-mode)))

;;; packages.el ends here

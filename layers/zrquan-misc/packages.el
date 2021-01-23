;;; packages.el --- zrquan-misc layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2020 Sylvain Benner & Contributors
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
;; added to `zrquan-misc-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `zrquan-misc/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `zrquan-misc/pre-init-PACKAGE' and/or
;;   `zrquan-misc/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst zrquan-misc-packages
  '(
    evil
    treemacs
    prodigy
    go-translate
    ))

(defun zrquan-misc/post-init-evil ()
  ;; 用 df 取代 Esc
  (setq-default evil-escape-key-sequence "df"))

(defun zrquan-misc/init-go-translate ()
  "google translate"
  (setq go-translate-base-url "https://translate.google.cn")
  (setq go-translate-target-language "zh-CN"))

(defun zrquan-misc/post-init-go-translate ()
  (with-eval-after-load 'go-translate
    ;; fix bug
    ;; https://github.com/atykhonov/google-translate/issues/52
    (defun go-translate-token--extract-tkk ()
      (cons 430675 2721866130))
    ))

(defun zrquan-misc/post-init-treemacs ()
  "treemacs 配置"
  (setq-default treemacs-python-executable "c:/Program Files/Python/Python38/python.exe")
  (setq-default treemacs-width 30))

(defun zrquan-misc/post-init-prodigy ()
  (progn
    (prodigy-define-service
      :name "Hugo Server"
      :command "hugo"
      :args '("server" "-D" "-w")
      :cwd "~/hugo"
      :tags '(hugo server)
      :kill-signal 'sigkill
      :kill-process-buffer-on-stop t)
    ))
;;; packages.el ends here

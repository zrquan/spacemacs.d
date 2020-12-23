;;; packages.el --- my-config layer packages file for Spacemacs.
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
;; added to `my-config-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `my-config/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `my-config/pre-init-PACKAGE' and/or
;;   `my-config/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst my-config-packages
  '(evil
    treemacs
    go-translate
    ))

(defun my-config/post-init-evil ()
  ;; 用 df 取代 Esc
  (setq-default evil-escape-key-sequence "df"))

(defun my-config/init-go-translate ()
  "google translate"
  (setq go-translate-base-url "https://translate.google.cn")
  (setq go-translate-target-language "zh-CN"))

(defun my-config/post-init-go-translate ()
  ;; fix bug
  ;; https://github.com/atykhonov/google-translate/issues/52
  (defun go-translate-token--extract-tkk ()
    (cons 430675 2721866130)))

(defun my-config/post-init-treemacs ()
  "treemacs 配置"
  (setq-default treemacs-python-executable "c:/Program Files/Python/Python38/python.exe"))

;;; packages.el ends here

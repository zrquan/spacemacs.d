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
    youdao-dictionary
    ivy-posframe))

(defun my-config/post-init-evil ()
  ;; 用 df 取代 Esc
  (setq-default evil-escape-key-sequence "df"))

(defun my-config/init-youdao-dictionary ()
  "有道词典插件"
  (setq url-automatic-caching t)
  (spacemacs/declare-prefix "y" "youdao")
  (spacemacs/set-leader-keys "yy" 'youdao-dictionary-search-at-point+)
  (spacemacs/set-leader-keys "ys" 'youdao-dictionary-search-from-input))

(defun my-config/init-ivy-posframe ()
  (use-package ivy-posframe
    :config (ivy-posframe-mode)))

(defun my-config/post-init-treemacs ()
  "treemacs 配置")

;;; packages.el ends here

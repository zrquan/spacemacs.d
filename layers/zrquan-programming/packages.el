;;; packages.el --- zrquan-programming layer packages file for Spacemacs.
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
;; added to `zrquan-programming-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `zrquan-programming/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `zrquan-programming/pre-init-PACKAGE' and/or
;;   `zrquan-programming/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst zrquan-programming-packages
  '(
    dap-mode
    gist
    ))

(defun zrquan-programming/post-init-dap-mode ()
  (define-fringe-bitmap 'breakpoint
    [128 64 224 16 248 4 254 4 248 16 224 64 128] nil nil 'center)
  (setq dap-auto-configure-features '(locals expression))
  )

(defun zrquan-programming/init-gist ()
  (use-package gist
    :defer t
    :init
    (progn
      (spacemacs/declare-prefix "gg" "gist")
      (spacemacs/set-leader-keys
        "ggb" 'gist-buffer
        "ggB" 'gist-buffer-private
        "ggl" 'gist-list
        "ggr" 'gist-region
        "ggR" 'gist-region-private))
    :config
    (progn
      (evilified-state-evilify-map gist-list-menu-mode-map
        :mode gist-list-mode
        :bindings
        "f" 'gist-fetch-current
        "K" 'gist-kill-current
        "o" 'gist-browse-current-url)
      (evilified-state-evilify-map gist-list-mode-map
        :mode gist-list-mode
        :bindings
        (kbd "gr") 'gist-list-reload))))

;;; packages.el ends here

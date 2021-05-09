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
    ivy-rich
    treemacs
    prodigy
    pyim
    emojify
    go-translate
    rainbow-mode
    ))

(defun zrquan-misc/init-rainbow-mode ()
  (use-package rainbow-mode
    :defer t
    :config
    (setq rainbow-x-colors nil)))

(defun zrquan-misc/post-init-pyim ()
  (use-package pyim
    :ensure nil
    :demand t
    :config
    (use-package pyim-basedict
      :ensure nil
      :config (pyim-basedict-enable)))

  (setq default-input-method "pyim")

  ;; 微软双拼
  (setq pyim-default-scheme 'microsoft-shuangpin)

  ;; 兼容`evil-escape'
  (defun my-pyim-self-insert-command (orig-func)
    (interactive "*")
    (if (and (local-variable-p 'last-event-time)
            (floatp last-event-time)
            (< (- (float-time) last-event-time) 0.2))
        (set (make-local-variable 'temp-evil-escape-mode) t)
      (set (make-local-variable 'temp-evil-escape-mode) nil)
      )
    (if (and temp-evil-escape-mode
            (equal (pyim-entered-get) "d")
            (equal last-command-event ?f))
        (progn
          (push last-command-event unread-command-events)
          (pyim-outcome-handle 'pyim-entered)
          (pyim-terminate-translation))
      (progn
        (call-interactively orig-func)
        (set (make-local-variable 'last-event-time) (float-time))
        ))
    )
  (advice-add 'pyim-self-insert-command :around #'my-pyim-self-insert-command)

  ;; 中/英文切换
  (setq-default pyim-english-input-switch-functions
                '(pyim-probe-dynamic-english
                  pyim-probe-isearch-mode
                  pyim-probe-program-mode
                  pyim-probe-org-structure-template))

  ;; 全/半角标点切换
  (setq-default pyim-punctuation-half-width-functions
                '(pyim-probe-punctuation-line-beginning
                  pyim-probe-punctuation-after-punctuation))

  (global-set-key (kbd "C-\\") 'toggle-input-method)
  (global-set-key (kbd "M-i") 'pyim-convert-code-at-point)
  (define-key pyim-mode-map "." 'pyim-page-next-page)
  (define-key pyim-mode-map "," 'pyim-page-previous-page)
  )

(defun zrquan-misc/init-emojify ()
  (use-package emojify
    :defer t
    :init
    (progn
      (setq emojify-emojis-dir (concat spacemacs-cache-directory "emojify/"))
      (spacemacs/set-leader-keys "oe" 'emojify-insert-emoji))
    ))

(defun zrquan-misc/post-init-ivy-rich ()
  ;; 解决`ivy-rich'卡顿问题
  ;; https://github.com/Yevgnen/ivy-rich/issues/87#issuecomment-740440509
  (with-eval-after-load 'ivy-rich
    (progn
      (defvar ek/ivy-rich-cache
        (make-hash-table :test 'equal))

      (defun ek/ivy-rich-cache-lookup (delegate candidate)
        (let ((result (gethash candidate ek/ivy-rich-cache)))
          (unless result
            (setq result (funcall delegate candidate))
            (puthash candidate result ek/ivy-rich-cache))
          result))

      (defun ek/ivy-rich-cache-reset ()
        (clrhash ek/ivy-rich-cache))

      (defun ek/ivy-rich-cache-rebuild ()
        (mapc (lambda (buffer)
                (ivy-rich--ivy-switch-buffer-transformer (buffer-name buffer)))
              (buffer-list)))

      (defun ek/ivy-rich-cache-rebuild-trigger ()
        (ek/ivy-rich-cache-reset)
        (run-with-idle-timer 1 nil 'ek/ivy-rich-cache-rebuild))

      (advice-add 'ivy-rich--ivy-switch-buffer-transformer :around 'ek/ivy-rich-cache-lookup)
      (advice-add 'ivy-switch-buffer :after 'ek/ivy-rich-cache-rebuild-trigger)))
  )

(defun zrquan-misc/post-init-evil ()
  ;; 用 df 取代 Esc
  (setq evil-escape-key-sequence "df"))

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
  (setq treemacs-python-executable "c:/Program Files/Python/Python38/python.exe")
  (setq treemacs-width 30))

(defun zrquan-misc/post-init-prodigy ()
  (progn
    ;; personal blog
    (prodigy-define-service
      :name "[Hugo] Blog"
      :command "hugo"
      :args '("server" "-D" "-w")
      :cwd "~/hugo"
      :tags '(hugo server)
      :kill-signal 'sigkill
      :kill-process-buffer-on-stop t)
    ;; evergreen notes
    (prodigy-define-service
      :name "[Hugo] Evergreen Notes"
      :command "hugo"
      :args '("server" "-D" "-w" "-p" "1314")
      :cwd "~/hugo-roam"
      :tags '(hugo server)
      :kill-signal 'sigkill
      :kill-process-buffer-on-stop t)
    ))

;;; packages.el ends here

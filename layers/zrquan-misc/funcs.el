;;; -*- lexical-binding: t; -*-

(defun zrquan/set-chinese-font (font size)
  (dolist (charset '(kana han cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font) charset
                      (font-spec :family font :size size)))
  )

(when (configuration-layer/package-used-p 'prodigy)
  (defun zrquan/browse-blog ()
    (interactive)
    (let* ((hugo-service-name "[Hugo] Blog")
           (hugo-service-port "1313")
           (hugo-service (prodigy-find-service hugo-service-name)))
      (unless (prodigy-service-started-p hugo-service)
        (prodigy-start-service hugo-service))
      (browse-url (concat "http://localhost:" hugo-service-port))
      ))

  (defun zrquan/browse-notes ()
    (interactive)
    (let* ((hugo-service-name "[Hugo] Evergreen Notes")
           (hugo-service-port "1314")
           (hugo-service (prodigy-find-service hugo-service-name)))
      (unless (prodigy-service-started-p hugo-service)
        (prodigy-start-service hugo-service))
      (browse-url (concat "http://localhost:" hugo-service-port))
      ))
  )

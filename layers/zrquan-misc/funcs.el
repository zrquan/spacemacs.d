;;; -*- lexical-binding: t; -*-

(defun zrquan/browse-hugo-maybe ()
  (interactive)
  (let ((hugo-service-name "Hugo Server")
        (hugo-service-port "1313"))
    (if (prodigy-service-started-p (prodigy-find-service hugo-service-name))
        (progn
          (browse-url (concat "http://localhost:" hugo-service-port)))
        (message "Server is not running!")
      )))

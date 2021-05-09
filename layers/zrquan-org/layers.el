;;; -*- lexical-binding: t; -*-

(configuration-layer/declare-layers
 '(
   (org
    :variables
    org-enable-hugo-support t
    org-enable-roam-support t
    org-enable-bootstrap-support t
    org-enable-reveal-js-support t)

   (plantuml
    :variables
    plantuml-jar-path "~/.spacemacs.d/opt/plantuml.jar"
    org-plantuml-jar-path "~/.spacemacs.d/opt/plantuml.jar")
   ))

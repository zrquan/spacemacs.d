;;; -*- lexical-binding: t; -*-

(configuration-layer/declare-layers
 '(
   html
   emacs-lisp

   (lsp
    :variables
    lsp-ui-doc-enable nil)

   (syntax-checking
    :variables
    syntax-checking-use-original-bitmaps t)

   (python
    :variables
    python-backend 'lsp
    python-lsp-server 'pyright)

   (java
    :variables
    java-backend 'lsp)

   (javascript
    :variables
    javascript-backend 'lsp)
   ))

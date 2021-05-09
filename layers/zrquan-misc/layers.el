;;; -*- lexical-binding: t; -*-

(configuration-layer/declare-layers
 '(
   shell
   ibuffer
   prodigy
   unicode-fonts
   better-defaults

   (git
    :variables
    magit-push-always-verify nil
    magit-save-repository-buffers 'dontask
    magit-revert-buffers 'silent
    magit-refs-show-commit-count 'all)

   (version-control
    :variables
    version-control-diff-tool 'git-gutter)

   (ivy
    :variables
    ivy-enable-advanced-buffer-information t)

   (auto-completion
    :variables
    auto-completion-enable-snippets-in-popup t
    auto-completion-enable-sort-by-usage t)

   (ranger
    :variables
    ranger-override-dired 'deer
    ranger-show-preview t)

   (treemacs
    :variables
    treemacs-use-all-the-icons-theme nil
    treemacs-use-icons-dired nil)

   (chinese
    :variables
    chinese-enable-youdao-dict t)
   ))

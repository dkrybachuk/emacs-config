;;; init-editing.el --- Editing confuration -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default fill-column 100)

(setq sentence-end-double-space nil)

;; Whitespace cleanup
(add-hook 'before-save-hook #'delete-trailing-whitespace)

;; EditorConfig
(use-package editorconfig
  :config
  (editorconfig-mode 1))

;; Rainbow delimiters
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; Multiple cursors
(use-package multiple-cursors
  :bind (("C-c m c" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)))

;; Expand region
(use-package expand-region
  :bind ("C-=" . er/expand-region))

;; Helpful
(use-package helpful
  :bind
  ([remap describe-function] . helpful-callable)
  ([remap describe-variable] . helpful-variable)
  ([remap describe-key] . helpful-key))

(provide 'init-editing)

;;; init-editing.el ends here

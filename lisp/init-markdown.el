;;; init-markdown.el --- Markdown configuration -*- lexical-binding: t; -*-
;;;Commentary:
;;; Code:

(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown"))

(custom-set-faces
 '(markdown-bold-face ((t (:foreground "orange" :weight bold)))))

;;(add-hook 'markdown-mode-hook #'display-fill-column-indicator-mode)

(use-package visual-fill-column
  :ensure t
  :hook ((markdown-mode . visual-fill-column-mode)
         (markdown-mode . visual-line-mode))
  :config
  (setq visual-fill-column-width 80)
  (setq visual-fill-column-center-text nil))


(provide 'init-markdown)
;;; init-markdown.el ends here

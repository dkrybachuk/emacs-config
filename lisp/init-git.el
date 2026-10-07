;;; init-git.el --- Git configuration -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package magit
  :bind
  ("C-x g" . magit-status))

(use-package diff-hl
  :hook
  ((prog-mode . diff-hl-mode)
   (magit-post-refresh . diff-hl-magit-post-refresh)))

(provide 'init-git)

;;; init-git.el ends here

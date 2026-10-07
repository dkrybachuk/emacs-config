;;; init-dired.el --- Diredb configuration -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package dired
  :ensure nil
  :commands (dired dired-jump)
  :bind (:map dired-mode-map
              ("v" . dired-view-file))
  :config
  (setq dired-recursive-deletes 'always)
  (setq dired-recursive-copies 'always)
  (setq dired-listing-switches "-agho --group-directories-first"))

(use-package dired-subtree
  :ensure t
  :after dired
  :bind (:map dired-mode-map
              ("<tab>" . dired-subtree-toggle)
              ("TAB" . dired-subtree-toggle)))

(provide 'init-dired)
;;; init-dired.el ends here

;;; init-org.el --- Org mode and Org-roam configuration -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org Mode Setup
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package org
  :ensure t
  :hook ((org-mode . visual-line-mode)
         (org-mode . org-indent-mode))
  :config
  (setq org-directory (expand-file-name "~/org")
        org-agenda-files (list org-directory)
        org-startup-folded 'content
        org-hide-emphasis-markers t
        org-ellipsis " ▾"
        org-src-fontify-natively t
        org-fontify-quote-and-verse-blocks t
        org-confirm-babel-evaluate nil)

  ;; Ensure org directory exists
  (when (not (file-directory-p org-directory))
    (make-directory org-directory t)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org-roam Setup
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory (expand-file-name "~/org/roam"))
  (org-roam-completion-everywhere t)
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ("C-c n j" . org-roam-dailies-capture-today))
  :config
  ;; Ensure org-roam directory exists
  (when (not (file-directory-p org-roam-directory))
    (make-directory org-roam-directory t))
  (org-roam-db-autosync-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Consult Org-roam Integration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package consult-org-roam
  :ensure t
  :after (consult org-roam)
  :init
  (consult-org-roam-mode 1)
  :custom
  (consult-org-roam-grep-func #'consult-ripgrep)
  :bind
  ("C-c n e" . consult-org-roam-file-find)
  ("C-c n b" . consult-org-roam-backlinks)
  ("C-c n s" . consult-org-roam-search))

(provide 'init-org)
;;; init-org.el ends here

;;; init-project.el --- Initialization configuration -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Projectile
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package projectile
  :diminish projectile-mode
  :init
  (projectile-mode)
  :custom
  (projectile-completion-system 'default)
  (projectile-project-search-path
   '("~/Projects"
     "~/Work"))
  :bind-keymap
  ("C-c p" . projectile-command-map))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Treemacs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package treemacs
  :bind
  ("C-c t" . treemacs))

(use-package treemacs-projectile
  :after (treemacs projectile))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Terminal
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package vterm
  :commands vterm)

;; If you prefer Eat instead:
;;
;; (use-package eat
;;   :ensure t)

(provide 'init-project)

;;; init-project.el ends here

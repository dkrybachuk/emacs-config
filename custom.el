;;; custom.el --- Custom settings -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; This mode allows to persist window configuration across session.
;(desktop-save-mode 1)

;; When typing, replace the selected region instead of inserting text
;; before it
(delete-selection-mode 1)

;; Automatically reload files when they have changed on disk.
(global-auto-revert-mode 1)

;; Remember the last cursor position in previously visited files.
(save-place-mode 1)

;; Save minibuffer history between Emacs session.
(savehist-mode 1)

;; Track recently opened files.
(recentf-mode 1)

;; Keep up to 1,000 entries in minibuffer histories.
(setq history-length 1000)

;; Keep up to 200 recently opened files.
(setq recentf-max-saved-items 200)

;; Enable automatic saving of modifed buffers.
(setq auto-save-default t)

;; Create backup files.
(setq make-backup-files t)

;; Store backups outside project directories.
(setq backup-directory-alist
      '(("." . ,(expand-file-name "backups/" user-emacs-directory))))

;; Use numbered backups.
(setq version-control t)

;; Keep several backup generations.
(setq kept-new-versions 5)
(setq kept-old-versions 2)

;; Delete excess backup generations automatically.
(setq delete-old-versions t)

;; Warn about files being edited elsewhere
(setq create-lockfiles t)

;; Ask for a single y/n confirmation before exiting Emacs.
(setq confirm-kill-emacs #'y-or-n-p)

;; Use short answers instead 'yes' and 'no'.
(setq use-short-answers t)

;; Use the trash instead of deleting files
(setq delete-by-moving-to-trash t)

;; Increase memory threshold for garbage collection during startup/heavy tasks
(setq gc-cons-threshold 100000000) ; 100 MB

;; Optimize line-number rendering performance
(setq-default display-line-numbers-widen t)

;; Improve rendering performance for long lines
(setq-default bidi-display-reordering nil)


;; Set maximum lines width
(setq-default fill-column 80)

;; Show the fill column indicator globaly
(global-display-fill-column-indicator-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(markdown-bold-face ((t (:foreground "orange" :weight bold)))))

;;; custom.el ends here

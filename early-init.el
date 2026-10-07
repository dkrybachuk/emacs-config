;;; early-init.el --- Early startup configuration -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; Faster startup
(setq gc-cons-threshold most-positive-fixnum)
(setq gc-cons-percentage 0.6)

;; Native compilation
(setq native-comp-async-report-warnings-errors 'silent)

;; Disable unnecessary GUI elements early
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Better frame defaults
(push '(fullscreen . maximized) default-frame-alist)

;; Restore GC after startup
(add-hook
 'emacs-startup-hook
 (lambda ()
   (setq gc-cons-threshold (* 100 1024 1024))
   (setq gc-cons-percentage 0.1)))

;;; early-init.el ends here

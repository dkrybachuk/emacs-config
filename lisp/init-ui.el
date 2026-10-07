;;; init-ui.el --- UI configuration -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; Theme
(use-package doom-themes
  :config
  ;; Global overrides
  (setq doom-themes-enable-bold t    ; if nil, bold is disabled
        doom-themes-enable-italic t) ; if nil, italics is disabled
  (load-theme 'doom-shades-of-purple t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)

  ;; Corrects (and improves) org-mode's native fontification
  (doom-themes-org-config))

;; Font (adjust to your system)
(set-face-attribute 'default nil
                    :family "JetBrainsMono Nerd Font"
                    :height 140)

;; Startup
(setq inhibit-startup-screen t)
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

;; Basic UI
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(global-display-line-numbers-mode 1)
(column-number-mode)
(size-indication-mode)

(global-hl-line-mode 1)
(show-paren-mode 1)
(electric-pair-mode 1)

(setq ring-bell-function #'ignore)
(blink-cursor-mode -1)

(pixel-scroll-precision-mode)

(setq visible-bell nil)

(setq frame-title-format
      '("%b — Emacs"))

(setq use-dialog-box nil)

;; UTF-8 everywhere
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)

(use-package doom-modeline
  :init (doom-modeline-mode 1))

(use-package ansi-color
  :ensure nil ; Built-in package
  :hook (compilation-filter . ansi-color-compilation-filter))

(use-package golden-ratio
  :config
  (golden-ratio-mode 1))

(use-package solaire-mode
  :config
  (solaire-mode 1))

(use-package spacious-padding
  :config
  (spacious-padding-mode 1))

(provide 'init-ui)

;;; init-ui.el ends here

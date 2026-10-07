;;; init-term.el --- The terminal configuration -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package vterm
  :ensure t)

(use-package multi-vterm
  :ensure t
  :config
  (setq multi-vterm-dedicated-window-height 25))

(setq vterm-environment
      '("TERM=xterm-256color"
        "COLORTERM=truecolor"))

(add-hook 'vterm-mode-hook (lambda () (setq-local global-hl-line-mode nil)))

(provide 'init-term)
;;; init-term.el ends here

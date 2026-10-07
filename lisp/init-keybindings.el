;;; init-keybindings.el --- Global keybindings -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(global-set-key (kbd "<escape>") #'keyboard-escape-quit)
(global-set-key (kbd "C-x k") #'kill-current-buffer)
(global-set-key (kbd "C-c f") #'consult-find)
(global-set-key (kbd "C-c g") #'consult-ripgrep)
(global-set-key (kbd "C-c b") #'consult-buffer)
(global-set-key (kbd "C-c i") #'consult-imenu)
(global-set-key (kbd "C-c e") #'embark-act)
(global-set-key (kbd "C-c t") #'treemacs)
(global-set-key (kbd "C-c o") #'olivetti-mode)
(global-set-key (kbd "C-x g") #'magit-status)
(global-set-key (kbd "M-o") #'other-window)
(global-set-key (kbd "C-c v") #'vterm)
(global-set-key (kbd "<f5>") #'dap-debug)
(global-set-key (kbd "<f9>") #'compile)
(global-set-key (kbd "<f12>") #'recompile)

(provide 'init-keybindings)

;;; init-keybindings.el ends here

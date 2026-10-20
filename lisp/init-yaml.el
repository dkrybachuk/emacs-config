;;; init-yaml.el --- YAML configuration -*- lexical-binding: t; -*-

;;; Commentary:
;;; Code:

(use-package yaml-mode
  :ensure t
  :mode ("\\.yml\\'" "\\.yaml\\'")
  :hook (yaml-mode . (lambda ()
                       (visual-line-mode 1))))

(provide 'init-yaml)

;;; init-yaml.el ends here

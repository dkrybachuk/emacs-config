;;; init-python.el --- Python development -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package python
  :ensure nil
  :mode ("\\.py\\'" . python-ts-mode)
  :interpreter ("python3" . python-ts-mode)
  :custom
  (python-shell-interpreter "python3"))

(use-package pyvenv
  :config
  (pyvenv-mode 1))

(use-package lsp-pyright
  :after lsp-mode
  :hook (python-ts-mode . (lambda ()
                            (require 'lsp-pyright)
                            (lsp-deferred)))
  :custom
  (lsp-pyright-typechecking-mode "basic"))

(use-package blacken
  :hook (python-ts-mode . blacken-mode)
  :custom
  (blacken-line-length 88))

(use-package python-pytest
  :after python)

(defun my/python-test-file ()
  (interactive)
  (compile
   (format "pytest %s"
           (shell-quote-argument (buffer-file-name)))))

(defun my/python-test-project ()
  (interactive)
  (compile "pytest"))

(defun my/python-run ()
  (interactive)
  (compile
   (format "python %s"
           (shell-quote-argument (buffer-file-name)))))

(defun my/python-format ()
  (interactive)
  (when (derived-mode-p 'python-ts-mode)
    (blacken-buffer)))

(add-hook
 'before-save-hook
 (lambda ()
   (when (derived-mode-p 'python-ts-mode)
     (blacken-buffer))))

(with-eval-after-load 'python

  (define-key python-ts-mode-map
              (kbd "C-c p r")
              #'my/python-run)

  (define-key python-ts-mode-map
              (kbd "C-c p t")
              #'my/python-test-file)

  (define-key python-ts-mode-map
              (kbd "C-c p a")
              #'my/python-test-project)

  (define-key python-ts-mode-map
              (kbd "C-c p v")
              #'pyvenv-activate)

  (define-key python-ts-mode-map
              (kbd "C-c p d")
              #'dap-debug))

(provide 'init-python)

;;; init-python.el ends here

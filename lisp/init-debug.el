;;; init-debug.el --- Debug configuration -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package dap-mode
  :after lsp-mode
  :commands dap-debug
  :config
  (require 'dap-java)
  (require 'dap-python)

  (setq dap-java-vm-args "--add-opens java.base/java.lang=ALL-UNNAMED")

  ;; Expand locals automatically.
  (setq dap-ui-locals-expand-depth 5)

  ;; Expand expressions to the same depth.
  (setq dap-ui-expressions-expand-depth 5)

  (setq dap-auto-configure-features
        '(sessions
          locals
          controls
          tooltip))

  (dap-auto-configure-mode))

(provide 'init-debug)

;;; init-debug.el ends here

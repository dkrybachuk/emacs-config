;;; init-lsp.el --- Language Server Protocol Configuration -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Tree-sitter
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq treesit-language-source-alist
      '((bash "https://github.com/tree-sitter/tree-sitter-bash")
        (java "https://github.com/tree-sitter/tree-sitter-java")
        (python "https://github.com/tree-sitter/tree-sitter-python")
        (json "https://github.com/tree-sitter/tree-sitter-json")
        (yaml "https://github.com/ikatyang/tree-sitter-yaml")
        (toml "https://github.com/tree-sitter/tree-sitter-toml")
        (markdown "https://github.com/ikatyang/tree-sitter-markdown")))

(defun my/install-treesitter-grammars ()
  (interactive)
  (dolist (lang '(bash
                  java
                  python
                  json
                  yaml
                  toml
                  markdown))
    (unless (treesit-language-available-p lang)
      (treesit-install-language-grammar lang))))

;; Automatically use Tree-sitter modes
(setq major-mode-remap-alist
      '((python-mode . python-ts-mode)
        (java-mode . java-ts-mode)
        (bash-mode . bash-ts-mode)
        (json-mode . json-ts-mode)))

;; Flycheck
(use-package flycheck
  :init
  (global-flycheck-mode))

;; LSP Mode
(use-package lsp-mode
  :commands lsp lsp-deferred
  :hook
  ((java-ts-mode . lsp-deferred)
   (python-ts-mode . lsp-deferred))
  :custom
  ;; Better performance
  (lsp-idle-delay 0.75)
  (lsp-log-io nil)
  (lsp-enable-snippet t)
  (lsp-enable-symbol-highlighting t)
  (lsp-headerline-breadcrumb-enable t)
  (lsp-completion-provider :none)
  ;; Let Corfu handle completion
  (lsp-prefer-capf t)
  ;; Timeout increase
  (lsp-request-timeout 10)
  ;; Performance
  (read-process-output-max (* 1024 1024))
  (gc-cons-threshold 100000000))

;; LSP UI
(use-package lsp-ui
  :after lsp-mode
  :commands lsp-ui-mode
  :custom
  (lsp-ui-doc-enable t)
  (lsp-ui-doc-position 'bottom)
  (lsp-ui-sideline-enable t)
  (lsp-ui-peek-enable t))

;; Treemacs
(use-package treemacs
  :ensure t
  :defer t
  :config
  (treemacs-git-mode 'deferred)
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

(use-package lsp-treemacs
  :ensure t
  :after (lsp-mode treemacs)
  :config
  (lsp-treemacs-sync-mode 1))

;; Xref
(setq xref-show-definitions-function #'xref-show-definitions-completing-read)
(setq xref-show-xrefs-function #'xref-show-definitions-completing-read)

;; Useful LSP keybindings
(with-eval-after-load 'lsp-mode
  (define-key lsp-mode-map (kbd "C-c l r") #'lsp-rename)
  (define-key lsp-mode-map (kbd "C-c l a") #'lsp-execute-code-action)
  (define-key lsp-mode-map (kbd "C-c l d") #'lsp-find-definition)
  (define-key lsp-mode-map (kbd "C-c l i") #'lsp-find-implementation)
  (define-key lsp-mode-map (kbd "C-c l t") #'lsp-find-type-definition)
  (define-key lsp-mode-map (kbd "C-c l h") #'lsp-describe-thing-at-point)
  (define-key lsp-mode-map (kbd "C-c l f") #'lsp-format-buffer))

;; Programming modes
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(add-hook 'prog-mode-hook #'hs-minor-mode)
(add-hook 'prog-mode-hook #'electric-indent-mode)

;; Fix freezes
;; 1. Force Blacklist Conflicting Clients
(with-eval-after-load 'lsp-mode
  ;; Block semgrep or generic linters from hijacking java-mode
  (add-to-list 'lsp-disabled-clients 'semgrep-ls)
  (add-to-list 'lsp-disabled-clients 'sonar-ls))

;; 2. Increase the Request Timeout Threshold
; Give JDTLS 30 seconds to reply to heavy workspace tasks
(setq lsp-response-timeout 30)

;; 3. Decouple Autocomplete Flooding (The Cache Race Condition)
(setq lsp-idle-delay 0.75)                    ; Wait 300ms of idle time before sending LSP requests

(setq company-idle-delay 0.75)                 ; Tiny buffer before the completion popup appears
(setq company-minimum-prefix-length 3)        ; Don't query JDTLS for single-letter words

(provide 'init-lsp)

;;; init-lsp.el ends here

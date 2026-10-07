;;; init-java.el --- Java development -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package java-ts-mode
  :ensure nil
  :mode "\\.java\\'")

(use-package lsp-java
  :after lsp-mode
  :hook (java-ts-mode . lsp-deferred)
  :custom
  (lsp-java-save-action-organize-imports t)
  (lsp-java-format-enabled t)
  (lsp-java-format-settings-url nil)
  (lsp-java-format-settings-profile "GoogleStyle")
  (setq lsp-java-jdt-download-url nil)
  (setq lsp-java-java-path "/usr/lib/jvm/java-21-openjdk/bin/java")
  :config

  ;; Enable all lsp-java extras
  (require 'lsp-java)

  ;; Java debugger
  ;; (lsp-java-boot-lens-mode)

  ;; Enable code lenses
  (setq lsp-lens-enable t)

  ;; Automatically configure DAP
;;  (lsp-jt-ls-install-server)

  (add-hook
   'java-ts-mode-hook
   #'lsp-lens-mode))

;; Automatic formatting
(defun my/java-format-on-save ()
  (when (derived-mode-p 'java-ts-mode)
    (lsp-format-buffer)
    (lsp-organize-imports)))

(add-hook 'before-save-hook #'my/java-format-on-save)

;; ;; Useful Java keybindings
;; (with-eval-after-load 'lsp-java

;;   (define-key java-ts-mode-map
;;               (kbd "C-c j o")
;;               #'lsp-java-organize-imports)

;;   (define-key java-ts-mode-map
;;               (kbd "C-c j t")
;;               #'lsp-java-update-project-configuration)

;;   (define-key java-ts-mode-map
;;               (kbd "C-c j r")
;;               #'lsp-java-build-project)

;;   (define-key java-ts-mode-map
;;               (kbd "C-c j s")
;;               #'lsp-java-open-super-implementation)

;;   (define-key java-ts-mode-map
;;               (kbd "C-c j i")
;;               #'lsp-java-add-import)

;;   (define-key java-ts-mode-map
;;               (kbd "C-c j g")
;;               #'lsp-java-generate-getters-and-setters)

;;   (define-key java-ts-mode-map
;;               (kbd "C-c j c")
;;               #'lsp-java-generate-constructors)

;;   (define-key java-ts-mode-map
;;               (kbd "C-c j h")
;;               #'lsp-java-generate-hash-code-equals)

;;   (define-key java-ts-mode-map
;;               (kbd "C-c j d")
;;               #'lsp-java-generate-to-string)

;;   (define-key java-ts-mode-map
;;               (kbd "C-c j r m")
;;               #'lsp-java-test-run-method)

;;   (define-key java-ts-mode-map
;;               (kbd "C-c j r c")
;;               #'lsp-java-test-run-class)

;;   (define-key java-ts-mode-map
;;               (kbd "C-c j r a")
;;               #'lsp-java-test-run-all))

;; Running Maven
(defun my/maven-test ()
  (interactive)
  (compile "mvn test"))

(defun my/maven-package ()
  (interactive)
  (compile "mvn package"))

(defun my/maven-clean ()
  (interactive)
  (compile "mvn clean"))

(defun my/maven-install ()
  (interactive)
  (compile "mvn install"))

;; Running Gradle
(defun my/gradle-build ()
  (interactive)
  (compile "./gradlew build"))

(defun my/gradle-test ()
  (interactive)
  (compile "./gradlew test"))

(defun my/gradle-run ()
  (interactive)
  (compile "./gradlew run"))

;; Java code style
(setq-default c-basic-offset 4)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

(setq lsp-java-vmargs
      '("-XX:+UseG1GC"
        "-XX:+UseStringDeduplication"
        "-Xmx4G"
        "-Xms1G"))

;; Recomend external formatter
;; (setq lsp-java-format-settings-url
;;      (expand-file-name "~/.config/google-java-format.xml"))

(provide 'init-java)

;;; init-java.el ends here

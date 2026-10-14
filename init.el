;;; init.el --- Main configuration -*- lexical-binding: t; -*-_
;;; Commentary:
;;; Code:

(add-to-list 'load-path
             (expand-file-name "lisp" user-emacs-directory))

(require 'init-packages)
(require 'init-completion)
(require 'init-ui)
(require 'init-env)
(require 'init-databases)
(require 'init-editing)
(require 'init-term)
(require 'init-project)
(require 'init-git)
(require 'init-lsp)
(require 'init-java)
(require 'init-python)
(require 'init-clojure)
(require 'init-debug)
(require 'init-dired)
(require 'init-markdown)
(require 'init-olivetti)
(require 'init-ai)
(require 'init-org)
(require 'init-keybindings)

(setq custom-file
      (expand-file-name "custom.el" user-emacs-directory))

(when (file-exists-p custom-file)
  (load custom-file))

(message "Startup successful")

;;; init.el ends here

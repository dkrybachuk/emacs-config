;;; init-packages.el --- Packages configuration -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'package)

(setq package-archives
      '(("gnu"   . "https://elpa.gnu.org/packages/")
        ("nongnu". "https://elpa.nongnu.org/nongnu/")
        ("melpa" . "https://melpa.org/packages/")))


(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(setq use-package-always-ensure t)

(use-package bind-key)

(provide 'init-packages)

;;; init-packages.el ends here

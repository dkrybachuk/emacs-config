;;; init-databases.el --- The terminal configuration -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'sql)

;; Do not ask for confirmation before sending SQL to a precess.
(setq sql-confirm nil)

;; Store SQL input history in the Emacs configuration directory.
(setq sql-input-ring-file-name
      (expand-file-name "sql-input-history" user-emacs-directory))

;; Keep a useful amount of SQL history.
(setq sql-input-ring-size 500)

;; Named database connections
(setq sql-connection-alist
      '((oracle-dev
         (sql-product 'oracle)
         (sql-database "172.24.24.1:1521/ORCL")
         (sql-user "TEST")
         (sql-server ""))

        (postgres-dev
         (sql-product 'postgres)
         (sql-server "172.24.24.1")
         (sql-port 5432)
         (sql-user "TEST")
         (sql-database "test"))))

(provide 'init-databases)
;;; init-databases.el ends here

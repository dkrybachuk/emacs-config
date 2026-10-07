;;; init-ai.el --- AI configuration -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package gptel
  :config
  (setq gptel-model 'gemini-3.6-flash
        gptel-backend (gptel-make-gemini "Gemini"
                 :key (getenv "GEMINI_API_KEY")
                 :stream t))

  (gptel-make-ollama "Ollama"
    :host "localhost:11434"
    :stream t
    :models '(sam860/lfm2.5:1.2b))

  ;; Optional: set default system prompt
  (setq gptel-default-system-prompt
        "You are a helpful assistant inside Emacs."))

(provide 'init-ai)
;;; init-ai.el ends here

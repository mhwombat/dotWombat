;;
;; Markdown files
;;

(setq markdown-command "pandoc --webtex")
; (setq markdown-live-preview-mode t)

;; (defun add-markdown-key-bindings-hook ()
;;   (defhydra hydra-markdown (:exit t)
;;     "markdown mode"
;;     ;; To preview, just save the file!
;;     ;; ("p" markdown-preview "preview")
;;     ;; ("x" markdown-other-window "preview")
;;     ("f" hydra-font/body "font")
;;     ("l" markdown-insert-link "insert link")
;;     ("i" markdown-insert-image "insert image")
;;   )
;;   (local-set-key (kbd "<menu>") 'hydra-markdown/body)

;;   (defhydra hydra-font (:exit t)
;;     "font"
;;     ("e" markdown-insert-italic "emphasis")
;;     ("t" markdown-insert-code "typewriter")
;;   )
;; )
;; (add-hook 'markdown-mode-hook 'add-markdown-key-bindings-hook)

;; Spell-checking.
(add-hook 'markdown-mode-hook 'flyspell-mode)

;; Fill column indicator
(add-hook 'markdown-mode-hook 'fci-mode)

;; Remove trailing whitespace
(add-hook 'markdown-mode-hook 'add-remove-trailing-whitespace-hook)
;;(require 'latex-pretty-symbols)

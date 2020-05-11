;;
;; Haskell
;;

;; (autoload 'whe "whe" "Wombat haskell stuff" t nil)

;; Fill column indicator
(add-hook 'haskell-mode-hook 'fci-mode)

;; Remove trailing whitespace
(add-hook 'haskell-mode-hook 'add-remove-trailing-whitespace-hook)

;; ;; REPL
;; (add-hook 'haskell-mode-hook 'interactive-haskell-mode)

;; Haskell unicode source candy
(setq haskell-font-lock-symbols t)

;; ;; Haskell indentation
;; (add-hook 'haskell-mode-hook 'haskell-indentation-mode)

;; ;; Hasktags
;; (let ((my-stack-path (expand-file-name "~/.local/bin")))
;;   (setenv "PATH" (concat my-stack-path path-separator (getenv "PATH")))
;;   (add-to-list 'exec-path my-stack-path))
;; (setq haskell-tags-on-save t)

;; (setq haskell-stylish-on-save t)

;; (setq package-selected-packages (quote (auctex haskell-mode)))

;;
;; Haskell
;;

;; (autoload 'whe "whe" "Wombat haskell stuff" t nil)

;; Fill column indicator
(add-hook 'haskell-mode-hook 'fci-mode)

;; Remove trailing whitespace
(add-hook 'haskell-mode-hook 'add-remove-trailing-whitespace-hook)

;; REPL
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

;; ;; Intero interactive development program for Haskell
;; (add-hook 'haskell-mode-hook 'intero-mode)

;; Haskell unicode source candy
(setq haskell-font-lock-symbols t)

;; ;; Haskell indentation
;; (add-hook 'haskell-mode-hook 'haskell-indentation-mode)

;; Hasktags
(let ((my-stack-path (expand-file-name "~/.local/bin")))
  (setenv "PATH" (concat my-stack-path path-separator (getenv "PATH")))
  (add-to-list 'exec-path my-stack-path))
(setq haskell-tags-on-save t)

(setq haskell-stylish-on-save t)


(setq package-selected-packages (quote (auctex haskell-mode)))

;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(haskell-stylish-on-save t)
;;  '(haskell-tags-on-save t)
;;  '(package-selected-packages (quote (auctex haskell-mode))))

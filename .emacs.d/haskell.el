;;
;; Haskell
;;

;; (autoload 'whe "whe" "Wombat haskell stuff" t nil)

;; Fill column indicator
(add-hook 'haskell-mode-hook 'fci-mode)

;; Remove trailing whitespace
(add-hook 'haskell-mode-hook 'add-remove-trailing-whitespace-hook)

;; Haskell unicode source candy
(setq haskell-font-lock-symbols t)

;; By default, Haskell formatting is provided by haskell-mode

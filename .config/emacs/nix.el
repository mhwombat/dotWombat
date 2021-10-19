;;
;; nix
;;

;; Fill column indicator
(add-hook 'nix-mode-hook 'fci-mode)

;; Remove trailing whitespace
(add-hook 'nix-mode-hook 'add-remove-trailing-whitespace-hook)


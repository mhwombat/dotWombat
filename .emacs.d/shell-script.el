;;
;; Shell scripts
;;

;; Fill column indicator
(add-hook 'shell-script-mode-hook 'fci-mode)

;; Remove trailing whitespace
(add-hook 'shell-script-mode-hook 'add-remove-trailing-whitespace-hook)


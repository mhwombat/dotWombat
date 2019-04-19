;;
;; C
;;

;; Fill column indicator
(add-hook 'c-mode-hook 'fci-mode)

;; Remove trailing whitespace
(add-hook 'c-mode-hook 'add-remove-trailing-whitespace-hook)


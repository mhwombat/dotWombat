;;
;; awk
;;

;; Fill column indicator
(add-hook 'awk-mode-hook 'fci-mode)

;; Remove trailing whitespace
(add-hook 'awk-mode-hook 'add-remove-trailing-whitespace-hook)


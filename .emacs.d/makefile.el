;;
;; Makefiles
;;

;; Fill column indicator
(add-hook 'makefile-mode-hook 'fci-mode)

;; Remove trailing whitespace
(add-hook 'makefile-mode-hook 'add-remove-trailing-whitespace-hook)


;;
;; python
;;

;; Fill column indicator
(add-hook 'python-mode-hook 'fci-mode)

;; Remove trailing whitespace
(add-hook 'python-mode-hook 'add-remove-trailing-whitespace-hook)


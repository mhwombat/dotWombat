;;
;; text
;;

;; Spell-checking.
(add-hook 'org-mode-hook 'flyspell-mode)

;; Fill column indicator
(add-hook 'text-mode-hook 'fci-mode)

;; Remove trailing whitespace
(add-hook 'text-mode-hook 'add-remove-trailing-whitespace-hook)


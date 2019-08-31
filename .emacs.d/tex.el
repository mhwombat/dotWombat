;;
;; TeX
;;

(defun add-tex-key-bindings-hook ()
  (defhydra hydra-tex (:exit t)
    "tex mode"
    ("s" (insert "Hi Wombat!") "source")
  )
  (local-set-key (kbd "<menu>") 'hydra-tex/body)
)
(add-hook 'latex-mode-hook 'add-tex-key-bindings-hook)

;; AUCTeX
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
;(setq TeX-save-query nil)
;(setq TeX-PDF-mode t)

;; Spell-checking.
(add-hook 'latex-mode-hook 'flyspell-mode)

;; Fill column indicator
(add-hook 'latex-mode-hook 'fci-mode)

;; Remove trailing whitespace
(add-hook 'latex-mode-hook 'add-remove-trailing-whitespace-hook)


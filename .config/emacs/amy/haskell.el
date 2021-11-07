;;
;; Haskell
;;

;; (autoload 'whe "whe" "Wombat haskell stuff" t nil)

;; Fill column indicator
(add-hook 'haskell-mode-hook 'fci-mode)

;; Remove trailing whitespace
(add-hook 'haskell-mode-hook 'add-remove-trailing-whitespace-hook)

;; format source code before saving
(add-hook 'before-save-hook 'haskell-mode-stylish-buffer)


;; Haskell unicode source candy
(setq haskell-font-lock-symbols t)

;; By default, Haskell formatting is provided by haskell-mode

(defun add-haskell-key-bindings-hook ()
  (defhydra hydra-haskell (:exit t)
    "haskell"
    ("c" haskell-check "check")
    ("?" haskell-describe "describe identifier")
    ("d" haskell-doc-mode "doc-mode")
    ("f" haskell-mode-stylish-buffer "format")
    ("h" haskell-hoogle "hoogle")
    ("#" haskell-mode-generate-tags "hoogle")
  )
  (local-set-key (kbd "<menu>") 'hydra-haskell/body)
)
(add-hook 'haskell-mode-hook 'add-haskell-key-bindings-hook)

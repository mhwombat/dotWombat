;;
;; python
;;

;; Fill column indicator
(add-hook 'python-mode-hook 'fci-mode)

;; Remove trailing whitespace
(add-hook 'python-mode-hook 'add-remove-trailing-whitespace-hook)

;; Code formatter
(setq enable-blacken-mode t)

(defun add-python-key-bindings-hook ()
  ;; (message "python-mode-hook invoked")
  (defhydra hydra-python (:exit t)
    "python mode"
    ("f" blacken-buffer "format")
    )
  (local-set-key (kbd "<menu>") 'hydra-python/body)
)
(add-hook 'python-mode-hook 'add-python-key-bindings-hook)

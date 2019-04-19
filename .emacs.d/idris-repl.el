;;
;; Idris REPL
;;

(defun add-idris-repl-key-bindings-hook ()
  (global-set-key (kbd "<up>") 'idris-repl-backward-history)
  (global-set-key (kbd "<down>") 'idris-repl-forward-history))
(add-hook 'idris-repl-mode-hook 'add-idris-repl-key-bindings-hook)

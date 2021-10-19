;;
;; Idris REPL
;;

(defun add-idris-repl-key-bindings-hook ()
  (local-set-key (kbd "<up>") 'idris-repl-backward-history)
  (local-set-key (kbd "<down>") 'idris-repl-forward-history))
(add-hook 'idris-repl-mode-hook 'add-idris-repl-key-bindings-hook)

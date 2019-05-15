;;
;; Idris
;;

;; Fill column indicator
(add-hook 'idris-mode-hook 'fci-mode)

;; Remove trailing whitespace
(add-hook 'idris-mode-hook 'add-remove-trailing-whitespace-hook)

(defun add-idris-key-bindings-hook ()
  (defhydra hydra-idris (:exit t)
    "idris"
    ("SPC" dabbrev-expand "expand")
    ("r" idris-repl "start REPL")
    ("l" idris-load-file "load in REPL")
    ("q" idris-quit "close REPL")
    ("t" idris-type-at-point "type")
    ("1" idris-add-clause "initial PM")
    ("2" idris-add-missing "missing PM")
    ("d" idris-docs-at-point "doc")
    ("s" idris-proof-search "proof")
    ("<up>" idris-make-lemma "lift")
    ("c" idris-case-dwim "case")
    ("w" idris-make-with-block "with")
    ("." prop-menu-by-completing-read "context")
    ("<left>" idris-previous-error "prev err" :exit nil)
    ("<right>" idris-next-error "next err" :exit nil)
    ("a" idris-apropos "apropos")
    ("h" helm-idris "search Idris docs")
  )
  (local-set-key (kbd "<menu>") 'hydra-idris/body)
)
(add-hook 'idris-mode-hook 'add-idris-key-bindings-hook)


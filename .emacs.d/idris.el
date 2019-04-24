;;
;; Idris
;;

;; Fill column indicator
(add-hook 'idris-mode-hook 'fci-mode)

;; Remove trailing whitespace
(add-hook 'idris-mode-hook 'add-remove-trailing-whitespace-hook)

(defun add-idris-key-bindings-hook ()
  (defhydra hydra-zoom (global-map "<f1>")
    "idris"
    ("SPC" dabbrev-expand "expand")
    ("l" idris-load-file "load REPL")
    ("t" idris-type-at-point "type")
    ("1" idris-add-clause "initial PM")
    ("2" idris-add-missing "missing PM")
    ("d" idris-docs-at-point "doc")
    ("s" idris-proof-search "proof")
    ("<up>" idris-make-lemma "lift")
    ("c" idris-case-dwim "case")
    ("w" idris-make-with-block "with")
    ("." prop-menu-by-completing-read "context")
    ("<left>" idris-previous-error "prev err")
    ("<right>" idris-next-error "next err")
    ("a" idris-apropos "apropos")))
(add-hook 'idris-mode-hook 'add-idris-key-bindings-hook)


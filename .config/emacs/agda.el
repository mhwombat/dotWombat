;;
;; Agda
;;

;; Fill column indicator
(add-hook 'agda2-mode-hook 'fci-mode)

;; Remove trailing whitespace
(add-hook 'agda2-mode-hook 'add-remove-trailing-whitespace-hook)


(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "agda-mode locate")))

(defun add-agda-key-bindings-hook ()
  (defhydra hydra-agda (:exit t)
    "agda"
    ("SPC" dabbrev-expand "expand")
    ("l" agda2-load "load")
    ("q" agda2-quit "quit Agda")
    ("r" agda2-restart "restart Agda")
    ("t" agda2-infer-type-maybe-toplevel "infer type")
    ("c" agda2-make-case "case")
    ("C" agda2-compile "compile")
    ("=" agda2-show-constraints "show constraints")
    ("s" agda2-solve-maybe-all "solve constraints")
    ("?" agda2-show-goals "show goals")
    ("." prop-menu-by-completing-read "context")
    ("<left>" agda2-previous-goal "prev goal")
    ("<right>" agda2-next-goal "next goal")
    ("n" agda2-compute-normalised-maybe-toplevel "normalise")
    ("," agda2-goal-and-context "hole info")
    ("a" agda2-abort "abort command")
    ("G" agda2-remove-annotations "remove goals")
    ("h" agda2-display-implicit-arguments "hide/display hidden args")
    ("o" agda2-module-contents-maybe-toplevel "module contents")
    ("z" agda2-search-about-toplevel "search defn")
    (";" agda2-comment-dwim-rest-of-buffer "(un)comment rest of buffer")
    ("S" agda2-set-program-version "switch Agda version")
    ("g" hydra-agda-goals/body "goals...")
  )
  (local-set-key (kbd "<menu>") 'hydra-agda/body)

  (defhydra hydra-agda-goals (:exit t)
    "goals"
    ("f" agda2-give "fill")
    ("r" agda2-refine "refine")
    ("a" agda2-auto "auto proof search")
    ("c" agda2-make-case "case")
    ("h" agda2-helper-function-type "helper fn type")
    ("t" agda2-goal-type "goal type")
    ("e" agda2-show-context "context")
    ("d" agda2-infer-type-maybe-toplevel "deduce type")
    ("," agda2-goal-and-context "goal type and context")
    ("." agda2-goal-and-context-and-inferred "goal type, context, deferred type")
    (";" agda2-goal-and-context-and-checked "goal type, context, checked term")
    ("n" agda2-compute-normalised-maybe-toplevel "normalise")
  )
)
(add-hook 'agda2-mode-hook 'add-agda-key-bindings-hook)






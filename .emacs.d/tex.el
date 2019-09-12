;;
;; TeX
;;

(defun add-tex-key-bindings-hook ()
  ;; (message "latex-mode-hook invoked")
  (defhydra hydra-tex (:exit t)
    "tex mode"
    ("e" LaTeX-environment "environment")
    ("f" hydra-font/body "font")
    ("s" LaTeX-section "section/chapter")
    ("t" hydra-templates/body "template")
    ("x" TeX-command-run-all "run all")
    ("v" TeX-view "view")
  )
  (local-set-key (kbd "<menu>") 'hydra-tex/body)

  (defhydra hydra-font (:exit t)
    "font"
    ("e" (TeX-font nil ?\C-e) "emphasis")
    ("t" (TeX-font nil ?\C-t) "typewriter")
  )

  (defhydra hydra-templates (:exit t)
    "template"
    ("a" (insert-file-contents "~/néal/templates/tex/article.tex") "article")
  )
)
(add-hook 'LaTeX-mode-hook 'add-tex-key-bindings-hook)
;; LaTeX-mode-hook is used by AUCTeX's LaTeX mode.
;; latex-mode-hook is used by Emacs' built-in latex mode.

;; AUCTeX
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
;(setq TeX-save-query nil)
;(setq TeX-PDF-mode t)
(setq TeX-view-program-selection '((output-pdf "Okular")))

;; Spell-checking.
(add-hook 'latex-mode-hook 'flyspell-mode)

;; Fill column indicator
(add-hook 'latex-mode-hook 'fci-mode)

;; Remove trailing whitespace
(add-hook 'latex-mode-hook 'add-remove-trailing-whitespace-hook)


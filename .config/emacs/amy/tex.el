;;
;; TeX
;;

(defun latex-table (tag caption)
  "Insert a table."
  (interactive "sTag? \nsCaption? ")
  (insert "\\begin{table}\n")
  (insert "    \\label{table:") (insert tag) (insert "}\n")
  (insert "    \\begin{center}\n")
  (insert "        \\caption{") (insert caption) (insert "}\n")
  (insert "        \\begin{tabular}{@{}cc@{}} \\toprule\n")
  (insert "            first & second \\\\\n")
  (insert "            \\midrule\n")
  (insert "            a & b \\\\\n")
  (insert "            c & d \\\\\n")
  (insert "            \\bottomrule\n")
  (insert "        \\end{tabular}\n")
  (insert "    \\end{center}\n")
  (insert "\\end{table}\n"))

(defun latex-graphic (filename caption)
  "Insert a graphic."
  (interactive "sFilename? \nsCaption?")
  (insert "\\begin{figure}\n")
  (insert "    \\label{fig:") (insert filename) (insert "}\n")
  (insert "    \\includegraphics[width=0.7\\linewidth]{./images/") (insert filename) (insert "}\n")
  (insert "    \\caption{") (insert caption) (insert "}\n")
  (insert "\\end{figure}\n"))

(defun latex-equation (tag)
  "Insert an equation."
  (interactive "sTag? ")
  (insert "\\begin{equation}\n")
  (insert "\\label{eq:") (insert tag) (insert "}\n")
  (insert "    1 + 1 = 2\n")
  (insert "\\end{equation}\n"))

(defun latex-matrix (tag)
  "Insert a matrix."
  (interactive)
  (insert "\\begin{matrix}\n")
  (insert "  a & b \\\\\n")
  (insert "  c & d \\\\\n")
  (insert "\\end{matrix}\n"))

(defun add-tex-key-bindings-hook ()
  ;; (message "latex-mode-hook invoked")
  (defhydra hydra-tex (:exit t)
    "tex mode"
    ("e" LaTeX-environment "environment")
    ("f" hydra-font/body "font")
    ("g" latex-graphic "graphic")
    ("m" hydra-maths/body "maths")
    ("s" LaTeX-section "section/chapter")
    ("t" latex-table "table")
    ("T" hydra-templates/body "template")
    ("x" TeX-command-run-all "run all")
    ("v" TeX-view "view")
  )
  (local-set-key (kbd "<menu>") 'hydra-tex/body)

  (defhydra hydra-font (:exit t)
    "font"
    ("e" (TeX-font nil ?\C-e) "emphasis")
    ("t" (TeX-font nil ?\C-t) "typewriter")
  )

  (defhydra hydra-maths (:exit t)
    "maths"
    ;; ("e" (insert "\\begin{equation}\n\\label{eq:?????}\n\\end{equation}\n") "equation")
    ("e" latex-equation "equation")
    ("f" (insert "\\frac{numerator}{denominator}") "fraction")
    ("i" (insert "\\int_{a}^{b}") "integral")
    ("m" latex-matrix "matrix")
    ("s" (insert "\\sum_{i=1}^{n}") "sum")
    ("t" (insert "\\text{abc}") "text")
  )

  (defhydra hydra-templates (:exit t)
    "template"
    ("a" (insert-file-contents "~/néal/templates/tex/article.tex") "article")
  )
)
(add-hook 'LaTeX-mode-hook 'add-tex-key-bindings-hook) ;; used by AUCTeX's LaTeX mode.
(add-hook 'latex-mode-hook 'add-tex-key-bindings-hook) ;; Emacs' built-in latex mode.

;; AUCTeX
(setq TeX-parse-self t) ; Enable parse on load.
;(setq TeX-auto-save t) ; Enable parse on save.
(setq-default TeX-master nil)
;(setq TeX-save-query nil)
;(setq TeX-PDF-mode t)
(setq TeX-view-program-selection '((output-pdf "Okular")))

;; Spell-checking.
(add-hook 'LaTeX-mode-hook 'flyspell-mode)

;; Fill column indicator
(add-hook 'LaTeX-mode-hook 'fci-mode)

;; Remove trailing whitespace
(add-hook 'LaTeX-mode-hook 'add-remove-trailing-whitespace-hook)

;; Show math symbols, Greek letters, etc. as Unicode
;;(require 'latex-pretty-symbols)

;; My custom key bindings
(global-set-key (kbd "C-s") (quote save-buffer))
(global-set-key (kbd "C-r") (quote query-replace))
(global-set-key (kbd "C-f") (quote isearch-forward))
(define-key isearch-mode-map (kbd "C-f") 'isearch-repeat-forward)
(global-set-key (kbd "C-S-f") (quote isearch-backward))
(define-key isearch-mode-map (kbd "C-S-f") 'isearch-repeat-backward)
(global-set-key (kbd "C-#") (quote comment-dwim))
(global-set-key (kbd "C-a") (quote mark-whole-buffer))
;; (global-set-key (kbd "<f12>") (quote browse-apropos-url-on-region))
;; (global-set-key (kbd "C-SPC") (quote hippie-expand))
(global-set-key (kbd "C-?") (quote wombat-emacs-help))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-switchb)

(global-unset-key (kbd "<menu>"))

;; Hydra key bindings
(require 'hydra)
(require 'helm)

;; NOTE: The style of hydra binding I use shows the hint as soon as the
;; hydra is invoked; but no other commands can be bound to this prefix.
;; See https://github.com/abo-abo/hydra/wiki/Binding-Styles for more
;; info.

(defhydra hydra-help (:exit t)
  "help"
  ("a" hydra-apropos/body "apropos")
  ("f" describe-function "describe function")
  ("i" info "info browser")
  ("n" (find-file "~/néal/eolas/emacs.org") "my emacs notes")
  ("k" hydra-keys/body "keys...")
)
(global-set-key (kbd "<f1>") 'hydra-help/body)

(defhydra hydra-file (:exit t)
  "files and buffers"
  ("." helm-find "find in .")
  ("~" (lambda () (interactive) (helm-find-1 "~/")) "find in ~")
  ("p" helm-browse-project "project")
  ("b" helm-buffers-list "buffer")
)
(global-set-key (kbd "<f2>") 'hydra-file/body)

(defhydra hydra-rectangle (:exit t)
  "rectangle mode"
  ("<right>" open-rectangle "indent")
  ("x" kill-rectangle "cut")
  ("c" copy-rectangle-as-kill "copy")
  ("v" yank-rectangle "paste")
)
(global-set-key (kbd "<f3>") 'hydra-rectangle/body)

(defhydra hydra-zoom ()
  "zoom"
  ("<up>" text-scale-increase "in")
  ("<down>" text-scale-decrease "out")
)
(global-set-key (kbd "<f4>") 'hydra-zoom/body)

(defhydra hydra-window ()
  "window"
  ("h" split-window-right "split horiz")
  ("v" split-window-below "split vert")
  ("t" enlarge-window-right "taller")
  ("w" enlarge-window-horizontally "wider")
  ("W" shrink-window-horizontally "wider")
  ("<right>" other-window "next")
  ("0" delete-window "delete")
)
(global-set-key (kbd "<f5>") 'hydra-window/body)

(defhydra hydra-keys (:exit t)
  "keys"
  ("f" describe-key-briefly "What function is bound to this key?")
  ("F" describe-key "Doc for function bound to key")
  ("k" where-is "What key is bound to this function?")
  ("b" describe-bindings "all key bindings")
)

(defhydra hydra-apropos (:exit t)
  "apropos"
  ("c" apropos-command "command")
  ("v" apropos-variable "variable")
)

(defhydra hydra-word ()
  "word mode"
  ("<left>" left-word "previous word")
  ("<right>" right-word "next word")
  ("<backspace>" backward-kill-word "delete previous word")
  ("<delete>" kill-word "delete next word")
)
(global-set-key (kbd "C-w") 'hydra-word/body)

(defhydra hydra-sentence ()
  "sentence mode"
  ("<left>" backward-sentence "previous sentence")
  ("<right>" forward-sentence "next sentence")
  ("<backspace>" backward-kill-sentence "delete previous sentence")
  ("<delete>" kill-sentence "delete next sentence")
)
(global-set-key (kbd "C-.") 'hydra-sentence/body)

(defhydra hydra-paragraph ()
  "paragraph mode"
  ("<left>" backward-paragraph "previous paragraph")
  ("<right>" forward-paragraph "next paragraph")
  ("<backspace>" backward-kill-paragraph "delete previous paragraph")
  ("<delete>" kill-paragraph "delete next paragraph")
  ("s" sort-paragraphs "sort")
)
(global-set-key (kbd "C-p") 'hydra-paragraph/body)

(defhydra hydra-line ()
  "line mode"
  ("<left>" previous-line "previous line")
  ("<right>" forward-line "next line")
  ("<backspace>" backward-kill-line "delete previous line")
  ("<delete>" kill-line "delete next line")
  ("s" sort-lines "sort")
)
(global-set-key (kbd "C-l") 'hydra-line/body)


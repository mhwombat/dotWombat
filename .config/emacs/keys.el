;;
;; Remove unwanted key bindings
;;
(global-unset-key (kbd "<menu>")) ;; reserve for hydra

(global-unset-key (kbd "C-a"))
(global-unset-key (kbd "C-b"))
(global-unset-key (kbd "C-c"))
(global-unset-key (kbd "C-d"))
(global-unset-key (kbd "C-e"))
(global-unset-key (kbd "C-f"))
(global-unset-key (kbd "C-g"))
(global-unset-key (kbd "C-h"))
(global-unset-key (kbd "C-i"))
(global-unset-key (kbd "C-j"))
(global-unset-key (kbd "C-k"))
(global-unset-key (kbd "C-l"))
(global-unset-key (kbd "C-m"))
(global-unset-key (kbd "C-n"))
(global-unset-key (kbd "C-o"))
(global-unset-key (kbd "C-p"))
(global-unset-key (kbd "C-q"))
(global-unset-key (kbd "C-r"))
(global-unset-key (kbd "C-s"))
(global-unset-key (kbd "C-t"))
(global-unset-key (kbd "C-u"))
(global-unset-key (kbd "C-v"))
(global-unset-key (kbd "C-w"))
(global-unset-key (kbd "C-x"))
(global-unset-key (kbd "C-y"))
(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C--"))
(global-unset-key (kbd "C-/"))
(global-unset-key (kbd "C-/"))
(global-unset-key (kbd "C-\\"))
(global-unset-key (kbd "C-]"))
(global-unset-key (kbd "C-SPC"))

(global-unset-key (kbd "M-a"))
(global-unset-key (kbd "M-b"))
(global-unset-key (kbd "M-c"))
(global-unset-key (kbd "M-d"))
(global-unset-key (kbd "M-e"))
(global-unset-key (kbd "M-f"))
(global-unset-key (kbd "M-g"))
(global-unset-key (kbd "M-h"))
(global-unset-key (kbd "M-i"))
(global-unset-key (kbd "M-j"))
(global-unset-key (kbd "M-k"))
(global-unset-key (kbd "M-l"))
(global-unset-key (kbd "M-m"))
(global-unset-key (kbd "M-n"))
(global-unset-key (kbd "M-o"))
(global-unset-key (kbd "M-p"))
(global-unset-key (kbd "M-q"))
(global-unset-key (kbd "M-r"))
(global-unset-key (kbd "M-s"))
(global-unset-key (kbd "M-t"))
(global-unset-key (kbd "M-u"))
(global-unset-key (kbd "M-v"))
(global-unset-key (kbd "M-w"))
(global-unset-key (kbd "M-x"))
(global-unset-key (kbd "M-y"))
(global-unset-key (kbd "M-z"))
(global-unset-key (kbd "M-!"))
(global-unset-key (kbd "M-$"))
(global-unset-key (kbd "M-%"))
(global-unset-key (kbd "M-&"))
(global-unset-key (kbd "M-'"))
(global-unset-key (kbd "M-("))
(global-unset-key (kbd "M-)"))
(global-unset-key (kbd "M-,"))
(global-unset-key (kbd "M--"))
(global-unset-key (kbd "M-."))
(global-unset-key (kbd "M-/"))
(global-unset-key (kbd "M-:"))
(global-unset-key (kbd "M-;"))
(global-unset-key (kbd "M-<"))
(global-unset-key (kbd "M-="))
(global-unset-key (kbd "M->"))
(global-unset-key (kbd "M-?"))
(global-unset-key (kbd "M-@"))
(global-unset-key (kbd "M-DEL"))
(global-unset-key (kbd "M-SPC"))
(global-unset-key (kbd "M-\\"))
(global-unset-key (kbd "M-^"))
(global-unset-key (kbd "M-`"))
(global-unset-key (kbd "M-{"))
(global-unset-key (kbd "M-|"))
(global-unset-key (kbd "M-}"))
(global-unset-key (kbd "M-~"))

(global-unset-key (kbd "C-M-a"))
(global-unset-key (kbd "C-M-b"))
(global-unset-key (kbd "C-M-c"))
(global-unset-key (kbd "C-M-d"))
(global-unset-key (kbd "C-M-e"))
(global-unset-key (kbd "C-M-f"))
(global-unset-key (kbd "C-M-g"))
(global-unset-key (kbd "C-M-h"))
(global-unset-key (kbd "C-M-i"))
(global-unset-key (kbd "C-M-j"))
(global-unset-key (kbd "C-M-k"))
(global-unset-key (kbd "C-M-l"))
(global-unset-key (kbd "C-M-m"))
(global-unset-key (kbd "C-M-n"))
(global-unset-key (kbd "C-M-o"))
(global-unset-key (kbd "C-M-p"))
(global-unset-key (kbd "C-M-q"))
(global-unset-key (kbd "C-M-r"))
(global-unset-key (kbd "C-M-s"))
(global-unset-key (kbd "C-M-t"))
(global-unset-key (kbd "C-M-u"))
(global-unset-key (kbd "C-M-v"))
(global-unset-key (kbd "C-M-w"))
(global-unset-key (kbd "C-M-x"))
(global-unset-key (kbd "C-M-y"))
(global-unset-key (kbd "C-M-z"))
(global-unset-key (kbd "C-M-%"))
(global-unset-key (kbd "C-M--"))
(global-unset-key (kbd "C-M-."))
(global-unset-key (kbd "C-M-/"))
(global-unset-key (kbd "C-M-@"))
(global-unset-key (kbd "C-M-SPC"))
(global-unset-key (kbd "C-M-\\"))

;;
;; Ordinary key bindings
;;
(global-set-key (kbd "C-s") (quote save-buffer))
(global-set-key (kbd "C-r") (quote query-replace))
(global-set-key (kbd "C-f") (quote isearch-forward))
(define-key isearch-mode-map (kbd "C-f") 'isearch-repeat-forward)
(global-set-key (kbd "C-S-f") (quote isearch-backward))
(define-key isearch-mode-map (kbd "C-S-f") 'isearch-repeat-backward)
(global-set-key (kbd "C-#") (quote comment-dwim))
(global-set-key (kbd "C-a") (quote mark-whole-buffer))
(global-set-key (kbd "C-q") (quote save-buffers-kill-terminal))
(global-set-key (kbd "C-+") (quote text-scale-increase))
(global-set-key (kbd "C-_") (quote text-scale-decrease))
(global-set-key (kbd "C-?") (quote wombat-emacs-help))
(global-set-key (kbd "C-#") (quote comment-dwim))
(global-set-key (kbd "C-s") (quote save-buffer))
(global-set-key (kbd "C-g") (quote keyboard-quit))
(global-set-key (kbd "C-m") (quote newline)) ;; same as <enter> key

;;
;; Hydra key bindings
;;

(require 'hydra)
;; (require 'helm)

;; NOTE: The style of hydra binding I use shows the hint as soon as the
;; hydra is invoked; but no other commands can be bound to this prefix.
;; See https://github.com/abo-abo/hydra/wiki/Binding-Styles for more
;; info.

(defhydra hydra-help (:exit t)
  "help"
  ("a" hydra-apropos/body "apropos")
  ("f" describe-function "describe function")
  ("i" info "info browser")
  ("m" describe-mode "mode info")
  ("n" (find-file "~/néal/eolas/emacs.org") "my emacs notes")
  ("k" hydra-keys/body "keys...")
  ("v" describe-variable "describe variable")
)
(global-set-key (kbd "<f1>") 'hydra-help/body)
(global-set-key (kbd "C-h") 'hydra-help/body)
(global-set-key (kbd "M-h") 'hydra-help/body)

(defhydra hydra-buffer (:exit t)
  "files and buffers"
  ("m" buffer-menu-open "buffer menu")
  ("<left>" previous-buffer "previous buffer")
  ("<right>" next-buffer "next buffer")
  ("c" buffer-menu-open "close buffer")
  ("g" goto-line "goto line")
)
(global-set-key (kbd "<f2>") 'hydra-buffer/body)
(global-set-key (kbd "M-b") 'hydra-buffer/body)

(defhydra hydra-window (:exit t)
  "window"
  ("h" split-window-right "split horiz")
  ("v" split-window-below "split vert")
  ("<up>" enlarge-window-right "taller")
  ("<down>" shrink-window-right "taller")
  ("<right>" enlarge-window-horizontally "wider")
  ("<left>" shrink-window-horizontally "narrower")
  ("n" other-window "next")
  ("0" delete-window "delete")
  ("1" delete-other-windows "just this window")
)
(global-set-key (kbd "<f3>") 'hydra-window/body)
(global-set-key (kbd "M-w") 'hydra-window/body)

(defhydra hydra-rectangle (:exit t)
  "rectangle mode"
  ("<right>" open-rectangle "indent")
  ("x" kill-rectangle "cut")
  ("c" copy-rectangle-as-kill "copy")
  ("v" yank-rectangle "paste")
)
(global-set-key (kbd "<f4>") 'hydra-rectangle/body)
(global-set-key (kbd "M-r") 'hydra-rectangle/body)

(defhydra hydra-shell (:exit t)
  "shell"
  ("RET" shell-command "command")
  ("a" async-shell-command "async command")
  ("r" shell-command-on-region "command on region")
)
(global-set-key (kbd "M-$") 'hydra-shell/body)
(global-set-key (kbd "M-RET") 'hydra-shell/body)

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
  "words"
  ("<left>" left-word "previous word")
  ("<right>" right-word "next word")
  ("<backspace>" backward-kill-word "delete previous word")
  ("<delete>" kill-word "delete next word")
)
(global-set-key (kbd "C-w") 'hydra-word/body)

(defhydra hydra-sentence ()
  "sentences"
  ("<left>" backward-sentence "previous sentence")
  ("<right>" forward-sentence "next sentence")
  ("<backspace>" backward-kill-sentence "delete previous sentence")
  ("<delete>" kill-sentence "delete next sentence")
)
(global-set-key (kbd "C-.") 'hydra-sentence/body)

(defhydra hydra-paragraph ()
  "paragraphs"
  ("<left>" backward-paragraph "previous paragraph")
  ("<right>" forward-paragraph "next paragraph")
  ("<backspace>" backward-kill-paragraph "delete previous paragraph")
  ("<delete>" kill-paragraph "delete next paragraph")
  ("s" sort-paragraphs "sort")
  ("f" fill-paragraph "fill" :exit t)
)
(global-set-key (kbd "C-p") 'hydra-paragraph/body)

(defhydra hydra-line ()
  "lines"
  ("<left>" previous-line "previous line")
  ("<right>" forward-line "next line")
  ("<backspace>" backward-kill-line "delete previous line")
  ("<delete>" kill-line "delete next line")
  ("s" sort-lines "sort")
)
(global-set-key (kbd "C-l") 'hydra-line/body)



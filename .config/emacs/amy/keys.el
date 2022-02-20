;;
;; Ordinary key bindings
;;
(define-key isearch-mode-map (kbd "C-S-f") 'isearch-repeat-backward)
(define-key isearch-mode-map (kbd "C-f") 'isearch-repeat-forward)
(global-set-key (kbd "C-#") (quote comment-dwim))
(global-set-key (kbd "C-+") (quote text-scale-increase))
(global-set-key (kbd "C-?") (quote wombat-emacs-help))
(global-set-key (kbd "C-S-f") (quote isearch-backward))
(global-set-key (kbd "C-_") (quote text-scale-decrease))
(global-set-key (kbd "C-a") (quote mark-whole-buffer))
(global-set-key (kbd "C-f") (quote isearch-forward))
(global-set-key (kbd "C-g") (quote keyboard-quit))
(global-set-key (kbd "C-m") (quote newline)) ;; same as <enter> key
(global-set-key (kbd "C-o") (quote find-file))
(global-set-key (kbd "C-q") (quote save-buffers-kill-terminal))
(global-set-key (kbd "C-r") (quote query-replace))
(global-set-key (kbd "C-s") (quote save-buffer))
(global-set-key (kbd "C-y") (quote undo-tree-redo))
(global-set-key (kbd "C-z") (quote undo-tree-undo))
(global-set-key (kbd "C-=") 'er/expand-region)

;; I don't like having to type ESC ESC ESC to get out of things.
;; This maps ESC to what C-g did.
(global-set-key (kbd "<escape>")      'keyboard-escape-quit)

;;
;; Hydra key bindings
;;


;; NOTE: The style of hydra binding I use shows the hint as soon as the
;; hydra is invoked; but no other commands can be bound to this prefix.
;; See https://github.com/abo-abo/hydra/wiki/Binding-Styles for more
;; info.

(defhydra hydra-main (:exit t)
  "main"
  ("h" hydra-help/body "help")
  ("f" hydra-file/body "file")
  ("b" hydra-buffer/body "buffer")
  ("W" hydra-window/body "window")
  ("w" hydra-word/body "word")
  ("." hydra-sentence/body "sentence")
  ("p" hydra-paragraph/body "paragraph")
  ("l" hydra-line/body "line")
  ("(" hydra-lisp/body "lisp")
  ("S" hydra-shell/body "shell")
  ("L" hydra-lsp/body "LSP")
  ("=" er/expand-region "expand selection")
)
(global-unset-key (kbd "<menu>")) ;; reserve for hydra
(global-set-key (kbd "<menu>") 'hydra-main/body)
(global-set-key (kbd "C-RET") 'hydra-main/body)

(defhydra hydra-help (:exit t)
  "help"
  ("a" hydra-apropos/body "apropos")
  ("f" describe-function "describe function")
  ("i" info "info browser")
  ("m" describe-mode "mode info")
  ("k" hydra-keys/body "keys... (Alt+k)")
  ("v" describe-variable "describe variable")
  ("p" esup "startup profiler")
)
(global-set-key (kbd "<f1>") 'hydra-help/body)
(global-set-key (kbd "C-h") 'hydra-help/body)
(global-set-key (kbd "M-h") 'hydra-help/body)

(defhydra hydra-file (:exit t)
  "file"
  ("o" find-file "open")
  ("a" write-file "save as...")
  ("d" dired "dired")
  ("f" fuzzy-finder "fuzzy")
  ("~" (fuzzy-finder :directory "~") "fuzzy")
  ("i" insert-file "insert")
)
(global-set-key (kbd "M-f") 'hydra-file/body)

(defhydra hydra-buffer (:exit t)
  "buffer"
  ("<left>" previous-buffer "previous buffer")
  ("<right>" next-buffer "next buffer")
  ("c" kill-buffer "close buffer")
  ("g" switch-to-buffer "goto buffer")
  ("l" goto-line "goto line")
  ("w" visual-line-mode "word wrap toggle")
)
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
(global-set-key (kbd "M-w") 'hydra-window/body)

(defhydra hydra-rectangle (:exit t)
  "rectangle mode"
  ("<right>" open-rectangle "indent")
  ("x" kill-rectangle "cut")
  ("c" copy-rectangle-as-kill "copy")
  ("v" yank-rectangle "paste")
)
(global-set-key (kbd "M-r") 'hydra-rectangle/body)

(defhydra hydra-lisp (:exit t)
  "lisp"
  ("f" execute-extended-command "call function")
  ("e" eval-expression "eval")
  ("a" universal-argument "argument")
  ("s" eval-last-sexp "eval sexp")
)
(global-set-key (kbd "M-l") 'hydra-lisp/body)

(defhydra hydra-shell (:exit t)
  "shell"
  ("RET" shell-command "command")
  ("a" async-shell-command "async command")
  ("r" shell-command-on-region "command on region")
)
(global-set-key (kbd "M-RET") 'hydra-shell/body)

(defhydra hydra-keys (:exit t)
  "keys"
  ("f" describe-key-briefly "What function is bound to this key?")
  ("F" describe-key "Doc for function bound to key")
  ("k" where-is "What key is bound to this function?")
  ("b" describe-bindings "all key bindings")
)
(global-set-key (kbd "M-k") 'hydra-keys/body)

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

(defhydra hydra-lsp (:exit t)
  "LSP"
  ("s" hydra-lsp-server/body "server/session")
  ("f" hydra-lsp-format/body "format")
  ("h" hydra-lsp-help/body "help")
  ("g" hydra-lsp-find/body "go to")
  ("d" hydra-lsp-directory/body "directory")
  ("r" hydra-lsp-refactor/body "refactor")
  ("p" hydra-lsp-peek/body "peek")
  ("a" hydra-lsp-action/body "action")
  ("t" hydra-lsp-toggle/body "toggle")
)
(global-set-key (kbd "M-l") 'hydra-lsp/body)

(defhydra hydra-lsp-server (:exit t)
  "server"
  ("s" lsp "start")
  ("r" lsp-workspace-restart "restart")
  ("Q" lsp-workspace-shutdown "shutdown")
  ("d" lsp-describe-session "describe session")
  ("B" lsp-disconnect "disconnect buffer from server")
)

(defhydra hydra-lsp-format (:exit t)
  "format"
  ("b" lsp-format-buffer "buffer")
  ("r" lsp-format-region "region")
)

(defhydra hydra-lsp-help (:exit t)
  "help"
  ("g" lsp-ui-doc-glance "glance")
  ("d" lsp-describe-thing-at-point "describe")
  ("s" lsp-signature-activate "signature")
)

;; Original LSP keymap defined in https://github.com/emacs-lsp/lsp-mode/blob/master/lsp-mode.el

;; Language server mode key binding
;; (setq lsp-keymap-prefix "M-x")

(defhydra hydra-lsp-find (:exit t)
  "find"
  ("a" xref-find-apropos "apropos")
  ("d" lsp-find-declaration "declarations")
  ("e" lsp-treemacs-errors-list "errors")
  ("=" lsp-find-definition "definitions")
  ("h" lsp-treemacs-call-hierarchy "hierarchy")
  ("i" lsp-find-implementation "implementation")
  ("r" lsp-find-references "references")
  ("t" lsp-find-type-definition "type")
)

(defhydra hydra-lsp-directory (:exit t)
  "directory"
  ("+" lsp-workspace-folders-add "add to workspace list")
  ("b" lsp-workspace-blacklist-remove "un-blacklist")
  ("-" lsp-workspace-folders-remove "remove from workspace list")
)

(defhydra hydra-lsp-refactor (:exit t)
  "refactor"
  ("i" lsp-organize-imports "organise imports")
  ("r" lsp-rename "rename")
)

(defhydra hydra-lsp-peek (:exit t)
  "peek"
  ("=" lsp-ui-peek-find-definitions "definition")
  ("i" lsp-ui-peek-find-implementation "implementation")
  ("r" lsp-ui-peek-find-references "references")
  ("x" lsp-ui-peek-find-workspace-symbol "symbol")
)

(defhydra hydra-lsp-action (:exit t)
  "action"
  ("c" lsp-execute-code-action "code")
  ("h" lsp-document-highlight "highlight")
  ("l" lsp-avy-lens "avy lens")
)

(defhydra hydra-lsp-toggle (:exit t)
  "toggle"
  ("D" lsp-modeline-diagnostics-mode "diagnostics")
  ("L" lsp-toggle-trace-io "log")
  ("S" lsp-ui-sideline-mode "sideline")
  ("t" lsp-treemacs-sync-mode "treemaps")
  ("a" lsp-modeline-code-actions-mode "actions")
  ("b" lsp-headerline-breadcrumb-mode "breadcrumb")
  ("d" lsp-ui-doc-mode "documentation popup")
  ("t" lsp-toggle-on-type-formatting "type formatting")
  ("h" lsp-toggle-symbol-highlight  "highlight")
  ("l" lsp-lens-mode "lens")
  ("s" lsp-toggle-signature-auto-activate "signature")
)

;; C-u RET 	When inserting C-u will change the behaviour from insert to replace or vice versa depending on lsp-completion-default-behaviour


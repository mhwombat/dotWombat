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

;; Hydra key bindings
(require 'hydra)

(defhydra hydra-help-mode (global-map "<f1>" :exit t)
  "help"
  ("<f1>" ignore "help" :exit nil)
  ("a" apropos-command "apropos")
  ("f" describe-function "describe function")
  ("i" info "info browser")
  ("n" wombat-emacs-help "my emacs notes")
  ("k" hydra-keys/body "keys...")
)

(defhydra hydra-file-mode (global-map "<f2>" :exit t)
  "files and buffers"
  ("<f2>" ignore "help" :exit nil)
  ("." helm-find "find in .")
  ("~" (lambda () (interactive) (helm-find-1 "~/")) "find in ~")
  ("p" helm-browse-project "project")
  ("b" helm-buffers-list "buffer")
)

(defhydra hydra-rectangle-mode (global-map "<f3>")
  "rectangle mode"
  ("<f3>" ignore "help")
  ("<right>" open-rectangle "indent")
  ("x" kill-rectangle "cut")
  ("c" copy-rectangle-as-kill "copy")
  ("v" yank-rectangle "paste")
)

(defhydra hydra-zoom (global-map "<f4>")
  "zoom"
  ("<f4>" ignore "help")
  ("<up>" text-scale-increase "in")
  ("<down>" text-scale-decrease "out")
)

(defhydra hydra-keys (:exit t)
  "keys"
  ("<f1>" ignore "help" :exit nil)
  ("f" describe-key-briefly "What function is bound to this key?")
  ("F" describe-key "Doc for function bound to key")
  ("k" where-is "What key is bound to this function?")
  ("b" describe-bindings "all key bindings")
)

(defhydra hydra-word-mode (global-map "C-w")
  "word mode"
  ("C-w" ignore "help")
  ("<left>" left-word "previous word")
  ("<right>" right-word "next word")
  ("<backspace>" backward-kill-word "delete previous word")
  ("<delete>" kill-word "delete next word")
)

(defhydra hydra-sentence-mode (global-map "C-.")
  "sentence mode"
  ("C-." ignore "help")
  ("<left>" backward-sentence "previous sentence")
  ("<right>" forward-sentence "next sentence")
  ("<backspace>" backward-kill-sentence "delete previous sentence")
  ("<delete>" kill-sentence "delete next sentence")
)

(defhydra hydra-paragraph-mode (global-map "C-p")
  "paragraph mode"
  ("C-p" ignore "help")
  ("<left>" backward-paragraph "previous paragraph")
  ("<right>" forward-paragraph "next paragraph")
  ("<backspace>" backward-kill-paragraph "delete previous paragraph")
  ("<delete>" kill-paragraph "delete next paragraph")
  ("s" sort-paragraphs "sort")
)

(defhydra hydra-line-mode (global-map "C-l")
  "line mode"
  ("C-l" ignore "help")
  ("s" sort-lines "sort")
)


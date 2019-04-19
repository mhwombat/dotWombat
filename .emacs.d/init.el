;;
;; Global settings
;;

(require 'package)  ;; This is built-in

;; optional. makes unpure packages archives unavailable
(setq package-archives nil)

(setq package-enable-at-startup nil)
(package-initialize)

;; No startup screen
(setq inhibit-startup-screen t)

;; No toolbar
(tool-bar-mode -1)

;; Open my emacs "cheat sheet"
(defun wombat-emacs-help ()
  (interactive)
  (find-file "~/néal/eolas/emacs.org"))

;; CUA
(cua-mode t)

;; Use a bar for the cursor
(set-default 'cursor-type 'box)
;; box, hollow, bar, or hbar

;; ;; Set location for custom scripts.
;; (add-to-list 'load-path "~/.emacs.d")

;; open with single window
(add-hook 'emacs-startup-hook 'delete-other-windows)

;; Show column-number in the mode line
(column-number-mode 1)

;; Highlight current line
(global-hl-line-mode)

;; Sentences don't need two spaces after the full stop.
(setq sentence-end-double-space nil)

;; Longer "Buffers" menu
(setq buffers-menu-max-size 50)

;; Highlight matching parentheses
(show-paren-mode)

;; Margin (fill column)
(setq-default fill-column 72)

;; Margin indicator
(require 'fill-column-indicator)
(setq fci-rule-width 1)
(setq fci-rule-color "lightblue")

;; AUCTeX
(setq TeX-auto-save t)
(setq TeX-parse-self t)

;; (setq amys-launch-directory default-directory)

;; ;; Repos
;; (add-to-list 'package-archives
;;              '("gnu" . "http://elpa.gnu.org/packages/") t)
;; (add-to-list 'package-archives
;;              '("melpa" . "http://melpa.org/packages/") t)
;; (add-to-list 'package-archives
;;              '("melpa-stable" . "http://stable.melpa.org/packages/") t)

;; Find out the major mode associated with a buffer.
(defun buffer-mode (&optional buffer-or-name)
  "Returns the major mode associated with a buffer.
If buffer-or-name is nil return current buffer's mode."
  (buffer-local-value 'major-mode
   (if buffer-or-name (get-buffer buffer-or-name) (current-buffer))))

;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )

;; My custom key bindings
(global-set-key (kbd "C-s") (quote save-buffer))
(global-set-key (kbd "C-r") (quote query-replace))
(global-set-key (kbd "C-f") (quote isearch-forward))
(global-set-key (kbd "C-f") 'isearch-forward)
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

(defhydra hydra-word-mode (global-map "C-w")
  "word mode"
  ("<left>" left-word "previous word")
  ("<right>" right-word "next word")
  ("<backspace>" backward-kill-word "delete previous word")
  ("<delete>" kill-word "delete next word"))
(defhydra hydra-sentence-mode (global-map "C-.")
  "sentence mode"
  ("<left>" backward-sentence "previous sentence")
  ("<right>" forward-sentence "next sentence")
  ("<backspace>" backward-kill-sentence "delete previous sentence")
  ("<delete>" kill-sentence "delete next sentence"))
(defhydra hydra-paragraph-mode (global-map "C-p")
  "paragraph mode"
  ("<left>" backward-paragraph "previous paragraph")
  ("<right>" forward-paragraph "next paragraph")
  ("<backspace>" backward-kill-paragraph "delete previous paragraph")
  ("<delete>" kill-paragraph "delete next paragraph")
  ("s" sort-paragraphs "sort"))
(defhydra hydra-line-mode (global-map "C-l")
  "line mode"
  ("s" sort-lines "sort"))
(defhydra hydra-rectangle-mode (global-map "<f2>")
  "rectangle mode"
  ("<right>" open-rectangle "indent")
  ("x" kill-rectangle "cut")
  ("c" copy-rectangle-as-kill "copy")
  ("v" yank-rectangle "paste"))
(defhydra hydra-zoom (global-map "<f3>")
  "zoom"
  ("g" text-scale-increase "in")
  ("l" text-scale-decrease "out"))

;;
;; Remove trailing whitespace
;;
(defun remove-trailing-whitespace ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "[ \t]+$" nil t)
      (replace-match "" nil nil)))
  nil)
(defun add-remove-trailing-whitespace-hook ()
  (add-hook 'local-write-file-hooks 'remove-trailing-whitespace))

;;
;; Language-specific
;;

(load "~/.emacs.d/c++.el")
(load "~/.emacs.d/c.el")
(load "~/.emacs.d/emacs-lisp.el")
(load "~/.emacs.d/haskell.el")
(load "~/.emacs.d/idris.el")
(load "~/.emacs.d/makefile.el")
(load "~/.emacs.d/nix.el")
(load "~/.emacs.d/org.el")
(load "~/.emacs.d/python.el")
(load "~/.emacs.d/shell-script.el")
(load "~/.emacs.d/text.el")

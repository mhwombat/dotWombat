;;
;; Set-up
;;

;; (require 'package)  ;; This is built-in

(add-to-list 'load-path "~/.config/emacs")


;;
;; General appearance
;;

;; Theme
(load-theme 'cyberpunk t)
;; (load-theme 'jazz t)
;; (load-theme 'monokai t)

;; No startup screen
(setq inhibit-startup-screen t)

;; No toolbar
(tool-bar-mode -1)

;; No menu bar
(menu-bar-mode -1)

;; Use a bar for the cursor
(set-default 'cursor-type 'box)

;; open with single window
(add-hook 'emacs-startup-hook 'delete-other-windows)

;; Show column-number in the mode line
(column-number-mode 1)

;; Highlight current line
(global-hl-line-mode)

;; Longer "Buffers" menu
(setq buffers-menu-max-size 50)

;; Sentences don't need two spaces after the full stop.
(setq sentence-end-double-space nil)

;; Find out the major mode associated with a buffer.
(defun buffer-mode (&optional buffer-or-name)
  "Returns the major mode associated with a buffer.
If buffer-or-name is nil return current buffer's mode."
  (buffer-local-value 'major-mode
   (if buffer-or-name (get-buffer buffer-or-name) (current-buffer))))


;;
;; Buffer appearance
;;

;; Set default font size
(set-face-attribute 'default nil :height 110)

;; Use pretty Unicode symbols
(setq global-prettify-symbols-mode 1)

;; Margin (fill column)
(setq-default fill-column 72)

;; Margin indicator
(require 'fill-column-indicator)
(setq fci-rule-width 1)
(setq fci-rule-color "lightblue")

;;
;; Key bindings
;;

;; CUA
(cua-mode t)

;; My custom key bindings
(load "keys")


;;
;; Editing
;;

;; Highlight matching parentheses
(show-paren-mode)

;; Tabs cause more trouble than they're worth
(setq-default indent-tabs-mode nil)

;; More conventional undo/redo behaviour
(global-undo-tree-mode)

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
(load "c++")
(load "c")
(load "emacs-lisp")
(load "haskell")
(load "makefile")
(load "markdown")
(load "python")
(load "shell-script")
(load "text")
(load "tex")

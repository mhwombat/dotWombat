;;
;; Global settings
;;

(require 'package)  ;; This is built-in

(add-to-list 'load-path "~/.config/emacs")
;; (setq default-directory "~/.config/emacs")

;; optional. makes unpure packages archives unavailable
(setq package-archives nil)

(setq package-enable-at-startup nil)
(package-initialize)

;; Set default font size
(set-face-attribute 'default nil :height 110)

;; No startup screen
(setq inhibit-startup-screen t)

;; No toolbar
(tool-bar-mode -1)

;; CUA
(cua-mode t)

;; Use a bar for the cursor
(set-default 'cursor-type 'box)
;; box, hollow, bar, or hbar

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

;; Use the built-in browser
(setq browse-url-browser-function 'eww-browse-url)

;; Tabs cause more trouble than they're worth
(setq-default indent-tabs-mode nil)

;;
;; Use pretty Unicode symbols
;;
(setq global-prettify-symbols-mode 1)

;; (setq amys-launch-directory default-directory)

;; Find out the major mode associated with a buffer.
(defun buffer-mode (&optional buffer-or-name)
  "Returns the major mode associated with a buffer.
If buffer-or-name is nil return current buffer's mode."
  (buffer-local-value 'major-mode
   (if buffer-or-name (get-buffer buffer-or-name) (current-buffer))))

;;
;; Key bindings
;;
(load "keys")

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

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

;; AUCTeX
(setq TeX-auto-save t)
(setq TeX-parse-self t)

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
(load "~/.emacs.d/keys.el")

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
(load "~/.emacs.d/agda.el")
(load "~/.emacs.d/c++.el")
(load "~/.emacs.d/c.el")
(load "~/.emacs.d/coq.el")
(load "~/.emacs.d/emacs-lisp.el")
(load "~/.emacs.d/haskell.el")
(load "~/.emacs.d/idris.el")
(load "~/.emacs.d/idris-repl.el")
(load "~/.emacs.d/makefile.el")
(load "~/.emacs.d/nix.el")
(load "~/.emacs.d/org.el")
(load "~/.emacs.d/python.el")
(load "~/.emacs.d/shell-script.el")
(load "~/.emacs.d/text.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values
   (quote
    ((org-emphasis-alist
      ("*" bold)
      ("/" italic)
      ("_"
       (:underline nil))
      ("=" org-verbatim verbatim)
      ("~" org-code verbatim)
      ("+"
       (:strike-through nil)))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

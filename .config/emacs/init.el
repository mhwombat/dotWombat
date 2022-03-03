;;
;; Set-up
;;

;; (add-to-list 'load-path (expand-file-name "~/.config/emacs/amy"))
(add-to-list 'custom-theme-load-path (expand-file-name "~/.config/emacs/amy/themes"))

;; Set backup directory.
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; Enable vertico
(vertico-mode)

;; Remeber recently edited files
(recentf-mode t)

;; Watch the files for all open buffers for changes on disk.
;; Automatically refresh those buffers if they don't have unsaved changes.
(global-auto-revert-mode t)

;; LSP configuration
(setq lsp-keymap-prefix "C-SPC")
(setq lsp-ui-sideline-enable t)
(setq lsp-ui-sideline-show-symbol t)
(setq lsp-ui-sideline-show-hover t)
(setq lsp-ui-sideline-show-flycheck t)
(setq lsp-ui-sideline-show-code-actions t)
(setq lsp-ui-sideline-show-diagnostics t)
(setq lsp-ui-peek-enable t)
(setq lsp-ui-doc-enable t)
(setq lsp-ui-doc-position 'top)
(setq lsp-ui-doc-show-with-cursor t)
(setq lsp-ui-doc-show-with-mouse nil)

;;
;; General appearance
;;

;; Theme
(load-theme 'base16-current t)

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
(load-file "~/.config/emacs/amy/keys.el")


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
(load-file "~/.config/emacs/amy/c++.el")
(load-file "~/.config/emacs/amy/c.el")
(load-file "~/.config/emacs/amy/emacs-lisp.el")
(load-file "~/.config/emacs/amy/haskell.el")
(load-file "~/.config/emacs/amy/makefile.el")
(load-file "~/.config/emacs/amy/markdown.el")
(load-file "~/.config/emacs/amy/python.el")
(load-file "~/.config/emacs/amy/shell-script.el")
(load-file "~/.config/emacs/amy/text.el")
(load-file "~/.config/emacs/amy/tex.el")

(defun display-startup-time ()
  (message "Emacs loaded in %s with %d garbage collections."
           (format "%2.f seconds"
                   (float-time
                    (time-subtract after-init-time before-init-time)))
           gcs-done))

(add-hook 'emacs-startup-hook #'display-startup-time)

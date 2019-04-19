;;
;; Org mode
;;

;; Spell-checking.
(add-hook 'org-mode-hook 'flyspell-mode)

;; Fill column indicator
(add-hook 'org-mode-hook 'fci-mode)

;; Remove trailing whitespace
(add-hook 'org-mode-hook 'add-remove-trailing-whitespace-hook)

(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (R . t)
   (awk . t)
   ;; (browser . t)
   (dot . t)
   (haskell . t)
   (latex . t)
   (lisp . t)
   (makefile . t)
   (python . t)
   ;; (sh . t)
   (shell . t)
   ))
;; Don't ask before evaluating code blocks.
(setq org-confirm-babel-evaluate nil)
;; Use syntax highlighting in source blocks while editing.
(setq org-src-fontify-natively t)
;; Allow shift + movement to expand selection in org mode.
(setq org-support-shift-select t)
;; Make equations bigger
(setq org-format-latex-options (plist-put org-format-latex-options :scale 1.5))
;; Start with preview of equations, images
(setq org-startup-latex-with-latex-preview t)

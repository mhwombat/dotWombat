;; base16-current-theme.el -- A base16 colorscheme

;;; Commentary:
;; Base16: (https://github.com/chriskempson/base16)

;;; Authors:
;; Scheme: Amy de Buitléir (http://amydebuitleir.eu)
;; Template: Kaleb Elwert <belak@coded.io>

;;; Code:

(require 'base16-theme)

(defvar base16-current-colors
  '(:base00 "#19171c"
    :base01 "#26232a"
    :base02 "#585260"
    :base03 "#655f6d"
    :base04 "#7e7887"
    :base05 "#8b8792"
    :base06 "#e2dfe7"
    :base07 "#efecf4"
    :base08 "#be4678"
    :base09 "#aa573c"
    :base0A "#a06e3b"
    :base0B "#2a9292"
    :base0C "#398bc6"
    :base0D "#576ddb"
    :base0E "#955ae7"
    :base0F "#bf40bf")
  "All colors for my custom theme are defined here.")

;; Define the theme
(deftheme base16-current)

;; Add all the faces to the theme
(base16-theme-define 'base16-current base16-current-colors)

;; Mark the theme as provided
(provide-theme 'base16-current)

(provide 'base16-current-theme)

;;; base16-current-theme.el ends here

;; base16-current-theme.el -- A base16 colorscheme

;;; Commentary:
;; Base16: (https://github.com/chriskempson/base16)

;;; Authors:
;; Scheme: Amy de Buitléir (http://amydebuitleir.eu)
;; Template: Kaleb Elwert <belak@coded.io>

;;; Code:

(require 'base16-theme)

(defvar base16-current-colors
  '(:base00 "#0A090C"
    :base01 "#231F28"
    :base02 "#413A4B"
    :base03 "#544B62"
    :base04 "#ABA3B8"
    :base05 "#F5F3F6"
    :base06 "#FAF9FB"
    :base07 "#FCFCFD"
    :base08 "#ffffcc"
    :base09 "#e5d8bd"
    :base0A "#decbe4"
    :base0B "#ccebc5"
    :base0C "#fddaec"
    :base0D "#b3cde3"
    :base0E "#fed9a6"
    :base0F "#fbb4ae")
  "All colors for my custom theme are defined here.")

;; Define the theme
(deftheme base16-current)

;; Add all the faces to the theme
(base16-theme-define 'base16-current base16-current-colors)

;; Mark the theme as provided
(provide-theme 'base16-current)

(provide 'base16-current-theme)

;;; base16-current-theme.el ends here

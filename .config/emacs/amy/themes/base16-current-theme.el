;; base16-current-theme.el -- A base16 colorscheme

;;; Commentary:
;; Base16: (https://github.com/chriskempson/base16)

;;; Authors:
;; Scheme: Amy de Buitléir (http://amydebuitleir.eu)
;; Template: Kaleb Elwert <belak@coded.io>

;;; Code:

(require 'base16-theme)

(defvar base16-current-colors
  '(:base00 "#080a0b"
    :base01 "#1e2329"
    :base02 "#38424c"
    :base03 "#495663"
    :base04 "#a1adb9"
    :base05 "#f3f4f6"
    :base06 "#f9f9fa"
    :base07 "#fcfcfc"
    :base08 "#ffcc99"
    :base09 "#99ffe5"
    :base0A "#99ccff"
    :base0B "#ff99fe"
    :base0C "#e5ff99"
    :base0D "#b299ff"
    :base0E "#ff99b2"
    :base0F "#99ff99")
  "All colors for my custom theme are defined here.")

;; Define the theme
(deftheme base16-current)

;; Add all the faces to the theme
(base16-theme-define 'base16-current base16-current-colors)

;; Mark the theme as provided
(provide-theme 'base16-current)

(provide 'base16-current-theme)

;;; base16-current-theme.el ends here

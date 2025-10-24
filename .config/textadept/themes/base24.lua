-- Base24 theme for Textadept, based on Mitchell's dark theme.
-- Currently using atmbwo lerppu-2

local view, colors, styles = view, view.colors, view.styles

-- Greyscale colors.
-- Only used for experiments.
colors.black = 0x000000
colors.light_black = 0x333333
colors.dark_grey = 0x666666
colors.grey = 0x999999
colors.light_grey = 0xCCCCCC
colors.white = 0xFFFFFF

-- Normal colors.
-- Only used for experiments.
colors.red = 0x0000FF
colors.orange = 0x0066CC
colors.yellow = 0x009999
colors.lime = 0x00CC99
colors.green = 0x00FF00
colors.teal = 0x999900
colors.blue = 0xFF0000
colors.violet = 0xCC0066
colors.purple = 0x990099
colors.magenta = 0x6600CC

-- Default font.
if not font then font = WIN32 and 'Consolas' or OSX and 'Monaco' or 'Monospace' end
if not size then size = not OSX and 10 or 12 end

--
-- Predefined styles.
--

-- everything (all elements inherit from this one)
styles[view.STYLE_DEFAULT] = {
	font = font, size = size, fore = 0xc3c9c6, back = 0x353b39
}

-- the line number margin
styles[view.STYLE_LINENUMBER] = {fore = 0xa5aeaa, back = 0x6b7772}

-- highlighted brace characters
styles[view.STYLE_BRACELIGHT] = {fore = 0x9b92f9, bold = true}

-- a brace character with no match
styles[view.STYLE_BRACEBAD] = {fore = 0x9b92f9}

-- control character blocks
-- styles[view.STYLE_CONTROLCHAR] = {} -- control character blocks

-- indentation guides
styles[view.STYLE_INDENTGUIDE] = {fore = 0x88938e}

-- call tip text
styles[view.STYLE_CALLTIP] = {fore = 0xc3c9c6, back = 0xc3c9c6}

 -- text displayed next to folded lines
styles[view.STYLE_FOLDDISPLAYTEXT] = {fore = 0x88938e, back = 0x353b39}

-- Tag styles. These are language-specific.
styles[lexer.ANNOTATION] = {fore = 0x92bcf9}
styles[lexer.ATTRIBUTE] = {fore = 0xce92f9}
styles[lexer.BOLD] = {bold = true}
styles[lexer.CLASS] = {fore = 0x92f9ce}
styles[lexer.CODE] = {fore = 0x92f9ce, eol_filled = true}
styles[lexer.COMMENT] = {fore = 0xa5aeaa}
styles[lexer.CONSTANT] = {fore = 0xce92f9}
styles[lexer.CONSTANT_BUILTIN] = {fore = 0xf992f0}
styles[lexer.EMBEDDED] = {fore = 0xbcf992, back = 0xbcf992}
styles[lexer.ERROR] = {fore = 0x9b92f9}
styles[lexer.FUNCTION] = {fore = 0x92bcf9}
styles[lexer.FUNCTION_BUILTIN] = {fore = 0x9b92f9}
styles[lexer.FUNCTION_METHOD] = {fore = 0x92bcf9}
styles[lexer.HEADING] = {bold = true, fore = 0xf9ce92}
-- styles[lexer.IDENTIFIER] = {}
styles[lexer.ITALIC] = {italic = true}
styles[lexer.KEYWORD] = {fore = 0x92f99c}
styles[lexer.LABEL] = {fore = 0xf992f0}
styles[lexer.LINK] = {underline = true}
styles[lexer.LIST] = {fore = 0x9b92f9}
styles[lexer.NUMBER] = {fore = 0xf0f992}
styles[lexer.OPERATOR] = {fore = 0x92eff9}
styles[lexer.PREPROCESSOR] = {fore = 0x92eff9}
styles[lexer.REFERENCE] = {underline = true}
styles[lexer.REGEX] = {fore = 0x92f99c}
styles[lexer.STRING] = {fore = 0xf99c92}
styles[lexer.TAG] = {fore = 0xf992bc}
styles[lexer.TYPE] = {fore = 0xbcf992}
styles[lexer.UNDERLINE] = {underline = true}
styles[lexer.VARIABLE] = {fore = 0xf992bc}
styles[lexer.VARIABLE_BUILTIN] = {fore = 0xf9ce92}
styles[lexer.WHITESPACE] = {fore = 0x92eff9}

-- CSS.
styles.property = styles[lexer.ATTRIBUTE]
-- styles.pseudoclass = {}
-- styles.pseudoelement = {}

-- Diff.
styles.addition = {fore = 0x92f99c}
styles.deletion = {fore = 0x9b92f9}
styles.change = {fore = 0x92eff9}

-- HTML.
styles.tag_unknown = styles.tag .. {italic = true}
styles.attribute_unknown = styles.attribute .. {italic = true}

-- Latex, TeX, and Texinfo.
styles.command = styles[lexer.KEYWORD]
styles.command_section = styles[lexer.HEADING]
styles.environment = styles[lexer.TYPE]
styles.environment_math = styles[lexer.NUMBER]

-- Makefile.
-- styles.target = {}

-- Markdown.
-- styles.hr = {}

-- Output.
styles.csi = {visible = false}
local csi_colors = {
	black = 0x000000, red = 0x9b92f9, green = 0x92f99c, yellow = 0x92eff9,
	blue = 0xf99c92, magenta = 0xf992f0, cyan = 0xf0f992, white = 0xffffff
}
for k, v in pairs(csi_colors) do styles['csi_' .. k] = {fore = v} end
for k, v in pairs(csi_colors) do styles['csi_' .. k .. '_bright'] = {fore = v, bold = true} end

-- Python.
styles.keyword_soft = {}

-- XML.
-- styles.cdata = {}

-- YAML.
styles.error_indent = {back = 0x9b92f9}

--
-- Element colors.
--

-- main selection text and background colors
view.element_color[view.ELEMENT_SELECTION_TEXT] = 0xffffff
view.element_color[view.ELEMENT_SELECTION_BACK] = 0xa5aeaa

-- additional selection text and background color
view.element_color[view.ELEMENT_SELECTION_ADDITIONAL_TEXT] = 0xffffff
view.element_color[view.ELEMENT_SELECTION_ADDITIONAL_BACK] = 0xa5aeaa

-- secondary selection text and background color
view.element_color[view.ELEMENT_SELECTION_SECONDARY_TEXT] = 0xffffff
view.element_color[view.ELEMENT_SELECTION_SECONDARY_BACK] = 0xa5aeaa

-- selection text and background color when another window has focus
view.element_color[view.ELEMENT_SELECTION_INACTIVE_TEXT] = 0xffffff
view.element_color[view.ELEMENT_SELECTION_INACTIVE_BACK] = 0xa5aeaa

-- inactive additional selection text and background color
view.element_color[view.ELEMENT_SELECTION_INACTIVE_ADDITIONAL_TEXT] = 0xffffff
view.element_color[view.ELEMENT_SELECTION_INACTIVE_ADDITIONAL_BACK] = 0xa5aeaa

-- main selection caret color
view.element_color[view.ELEMENT_CARET] = 0xf992bc

-- additional selection caret color
view.element_color[view.ELEMENT_CARET_ADDITIONAL] = 0xf992bc

-- background color of the line that contains the caret. MUST BE TRANSLUCENT
view.element_color[view.ELEMENT_CARET_LINE_BACK] = 0x6b7772 | 0x60000000

-- visible white space text and background color NOT USED?
view.element_color[view.ELEMENT_WHITE_SPACE] = 0x92eff9
view.element_color[view.ELEMENT_WHITE_SPACE_BACK] = 0x353b39

-- fold line color NOT USED?
view.element_color[view.ELEMENT_FOLD_LINE] = 0x88938e

-- color of lines shown in place of hidden lines NOT USED?
view.element_color[view.ELEMENT_HIDDEN_LINE] = 0x88938e

-- How the caret is drawn
--
-- view.LAYER_BASE: Draw the caret line opaquely on the background.
-- view.LAYER_UNDER_TEXT: Draw the caret line translucently under text.
-- view.LAYER_OVER_TEXT: Draw the caret line translucently over text.
--
view.caret_line_layer = view.LAYER_UNDER_TEXT

-- Fold Margin.
-- set these the same if you don't want that tiny checkerboard effect
view:set_fold_margin_color(true, 0x6b7772) -- default
view:set_fold_margin_hi_color(true, 0x6b7772) -- highlight

--
-- Markers.
--
--   view.marker_fore             Map of marker numbers to their foreground colors in "0xBBGGRR" format
--   view.marker_back             Map of marker numbers to their background colors in "0xBBGGRR" format
--   view.marker_back_translucent Map of marker numbers to their background colors in "0xAABBGGRR" format
--

-- bookmark mark number
view.marker_fore[textadept.bookmarks.MARK_BOOKMARK] = 0xf992bc
view.marker_back[textadept.bookmarks.MARK_BOOKMARK] = 0x353b39

-- run or compile warning marker number
view.marker_fore[textadept.run.MARK_WARNING] = 0x92eff9
view.marker_back[textadept.run.MARK_WARNING] = 0x353b39

-- run or compile error marker number
view.marker_fore[textadept.run.MARK_ERROR] = 0x9b92f9
view.marker_back[textadept.run.MARK_ERROR] = 0x353b39

-- Line was changed and has not yet been saved
view.marker_fore[view.MARKNUM_HISTORY_MODIFIED] = 0x92eff9
view.marker_back[view.MARKNUM_HISTORY_MODIFIED] = 0x353b39

-- Line was changed and saved
view.marker_fore[view.MARKNUM_HISTORY_SAVED] = 0xc3c9c6
view.marker_back[view.MARKNUM_HISTORY_SAVED] = 0x353b39

-- Line was changed, saved, then partially reverted
view.marker_fore[view.MARKNUM_HISTORY_REVERTED_TO_MODIFIED] = 0x92eff9
view.marker_back[view.MARKNUM_HISTORY_REVERTED_TO_MODIFIED] = 0x353b39

-- Line was changed, saved, then fully reverted
view.marker_fore[view.MARKNUM_HISTORY_REVERTED_TO_ORIGIN] = 0xc3c9c6
view.marker_back[view.MARKNUM_HISTORY_REVERTED_TO_ORIGIN] = 0x353b39

-- Pre-defined marker numbers used for code folding marker symbols
--
-- view.MARKNUM_FOLDEROPEN  The first line of an expanded fold
-- view.MARKNUM_FOLDERSUB  A line within an expanded fold
-- view.MARKNUM_FOLDERTAIL  The last line of an expanded fold
-- view.MARKNUM_FOLDER  The first line of a collapsed fold
-- view.MARKNUM_FOLDEROPENMID  The first line of an expanded fold within an expanded fold
-- view.MARKNUM_FOLDERMIDTAIL  The last line of an expanded fold within an expanded fold
-- view.MARKNUM_FOLDEREND  The first line of a collapsed fold within an expanded fold
--
for i = view.MARKNUM_FOLDEREND, view.MARKNUM_FOLDEROPEN do -- fold margin
	view.marker_fore[i] = 0x88938e
	view.marker_back[i] = 0x353b39
	view.marker_back_selected[i] = 0x353b39
end

--
-- Indicators.
--
--   view.indic_fore   Map of indicator numbers to their foreground colors
--   view.indic_alpha  Map of indicator numbers to their fill color alpha values
--

-- The find results highlight indicator number.
view.indic_fore[ui.find.INDIC_FIND] = 0xffffff
view.indic_alpha[ui.find.INDIC_FIND] = 0x80

-- The word highlight indicator number.
view.indic_fore[textadept.editing.INDIC_HIGHLIGHT] = 0x353b39
view.indic_alpha[textadept.editing.INDIC_HIGHLIGHT] = 0x80

-- The snippet placeholder indicator number.
view.indic_fore[textadept.snippets.INDIC_PLACEHOLDER] = 0xc3c9c6

-- The run or compile warning indicator number.
view.indic_fore[textadept.run.INDIC_WARNING] = 0xffffff

-- The run or compile error marker number.
view.indic_fore[textadept.run.INDIC_ERROR] = 0x9b92f9

-- Text was inserted and has not yet been saved
view.indic_fore[view.INDICATOR_HISTORY_MODIFIED_INSERTION] = 0x92f99c

-- Text was deleted but not yet saved
view.indic_fore[view.INDICATOR_HISTORY_MODIFIED_DELETION] = 0x9b92f9

-- Text was inserted and saved
view.indic_fore[view.INDICATOR_HISTORY_SAVED_INSERTION] = 0x92f99c

-- Text was deleted and saved
view.indic_fore[view.INDICATOR_HISTORY_SAVED_DELETION] = 0x9b92f9

-- Text was inserted, saved, and semi-reverted
view.indic_fore[view.INDICATOR_HISTORY_REVERTED_TO_MODIFIED_INSERTION] = 0x92f99c

-- Text was deleted, saved, and semi-reverted
view.indic_fore[view.INDICATOR_HISTORY_REVERTED_TO_MODIFIED_DELETION] = 0x9b92f9

-- Text was inserted, saved, and fully reverted
view.indic_fore[view.INDICATOR_HISTORY_REVERTED_TO_ORIGIN_INSERTION] = 0x92f99c

-- Text was deleted, saved, and fully reverted
view.indic_fore[view.INDICATOR_HISTORY_REVERTED_TO_ORIGIN_DELETION] = 0x9b92f9

-- Call tips.
-- call tip’s highlighted text foreground color
view.call_tip_fore_hlt = 0xf992f0

-- Long Lines.
-- If a vertical line is displayed at view.edge_colum, it will be this color.
-- Any characters displayed after view.edge_column will be this colour.
view.edge_color = 0xa5aeaa

-- Find & replace pane entries.
ui.find.entry_font = font .. ' ' .. size

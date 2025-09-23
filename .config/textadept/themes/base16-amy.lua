-- Base16 theme for Textadept, based on Mitchell's dark theme.

local view, colors, styles = view, view.colors, view.styles

colors.base00 = 0x131513
colors.base01 = 0x242924
colors.base02 = 0x5E6E5E
colors.base03 = 0x687D68
colors.base04 = 0x809980
colors.base05 = 0x8CA68C
colors.base06 = 0xCfE8Cf
colors.base07 = 0xF4FBF4
colors.base08 = 0xE6193C
colors.base09 = 0x87711D
colors.base0A = 0xFFFFFF -- unused
colors.base0B = 0x29A329
colors.baseOC = 0x1999B3
colors.base0D = 0x3D62F5
colors.base0E = 0xAD2BEE
colors.base0F = 0xE619C3 -- unused

-- Default font.
if not font then font = WIN32 and 'Consolas' or OSX and 'Monaco' or 'Monospace' end
if not size then size = not OSX and 10 or 12 end

-- Predefined styles.
styles[view.STYLE_DEFAULT] = {
	font = font, size = size, fore = colors.base05, back = colors.base00
}
styles[view.STYLE_LINENUMBER] = {fore = colors.base03, back = colors.base00}
styles[view.STYLE_BRACELIGHT] = {fore = colors.base0E, bold = true}
styles[view.STYLE_BRACEBAD] = {fore = colors.base08}
-- styles[view.STYLE_CONTROLCHAR] = {}
styles[view.STYLE_INDENTGUIDE] = {fore = colors.base02}
styles[view.STYLE_CALLTIP] = {fore = colors.base05, back = colors.base02}
styles[view.STYLE_FOLDDISPLAYTEXT] = {fore = colors.base03, back = colors.base02}

-- Tag styles.
styles[lexer.ANNOTATION] = {fore = colors.base0D}
styles[lexer.ATTRIBUTE] = {fore = colors.base04}
styles[lexer.BOLD] = {bold = true}
styles[lexer.CLASS] = {fore = colors.base07}
styles[lexer.CODE] = {fore = colors.base03, eol_filled = true}
styles[lexer.COMMENT] = {fore = colors.base03}
-- styles[lexer.CONSTANT] = {}
styles[lexer.CONSTANT_BUILTIN] = {fore = colors.base06}
styles[lexer.EMBEDDED] = {fore = colors.base06}
styles[lexer.ERROR] = {fore = colors.base08}
-- styles[lexer.FUNCTION] = {}
styles[lexer.FUNCTION_BUILTIN] = {fore = colors.base01}
-- styles[lexer.FUNCTION_METHOD] = {}
styles[lexer.HEADING] = {fore = colors.base0D}
-- styles[lexer.IDENTIFIER] = {}
styles[lexer.ITALIC] = {italic = true}
styles[lexer.KEYWORD] = {fore = colors.base0E}
styles[lexer.LABEL] = {fore = colors.base0D}
styles[lexer.LINK] = {underline = true}
styles[lexer.LIST] = {fore = colors.base09}
styles[lexer.NUMBER] = {fore = colors.base09}
-- styles[lexer.OPERATOR] = {}
styles[lexer.PREPROCESSOR] = {fore = colors.base0D}
styles[lexer.REFERENCE] = {underline = true}
styles[lexer.REGEX] = {fore = colors.baseOC}
styles[lexer.STRING] = {fore = colors.base0B}
styles[lexer.TAG] = {fore = colors.base0E}
styles[lexer.TYPE] = {fore = colors.base04}
styles[lexer.UNDERLINE] = {underline = true}
-- styles[lexer.VARIABLE] = {}
styles[lexer.VARIABLE_BUILTIN] = {fore = colors.base07}
-- styles[lexer.WHITESPACE] = {}

-- CSS.
styles.property = styles[lexer.ATTRIBUTE]
-- styles.pseudoclass = {}
-- styles.pseudoelement = {}
-- Diff.
styles.addition = {fore = colors.base0B}
styles.deletion = {fore = colors.base08}
styles.change = {fore = colors.base07}
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
	black = colors.base00, red = colors.base08, green = colors.base0B, yellow = colors.base07,
	blue = colors.base0E, magenta = colors.base0D, cyan = colors.base09, white = colors.base0A
}
for k, v in pairs(csi_colors) do styles['csi_' .. k] = {fore = v} end
for k, v in pairs(csi_colors) do styles['csi_' .. k .. '_bright'] = {fore = v, bold = true} end
-- Python.
styles.keyword_soft = {}
-- XML.
-- styles.cdata = {}
-- YAML.
styles.error_indent = {back = colors.base08}

-- Element colors.
-- view.element_color[view.ELEMENT_SELECTION_TEXT] = colors.base05
view.element_color[view.ELEMENT_SELECTION_BACK] = colors.base02
-- view.element_color[view.ELEMENT_SELECTION_ADDITIONAL_TEXT] = colors.base05
view.element_color[view.ELEMENT_SELECTION_ADDITIONAL_BACK] = colors.base02
-- view.element_color[view.ELEMENT_SELECTION_SECONDARY_TEXT] = colors.base05
view.element_color[view.ELEMENT_SELECTION_SECONDARY_BACK] = colors.base02
-- view.element_color[view.ELEMENT_SELECTION_INACTIVE_TEXT] = colors.base05
view.element_color[view.ELEMENT_SELECTION_INACTIVE_BACK] = colors.base02
-- view.element_color[view.ELEMENT_SELECTION_INACTIVE_ADDITIONAL_TEXT] = colors.base05
view.element_color[view.ELEMENT_SELECTION_INACTIVE_ADDITIONAL_BACK] = colors.base02
view.element_color[view.ELEMENT_CARET] = colors.base05
-- view.element_color[view.ELEMENT_CARET_ADDITIONAL] =
if view ~= ui.command_entry then
	view.element_color[view.ELEMENT_CARET_LINE_BACK] = colors.base02 | 0x80000000
end
view.caret_line_layer = view.LAYER_UNDER_TEXT

-- Fold Margin.
view:set_fold_margin_color(true, colors.base00)
view:set_fold_margin_hi_color(true, colors.base00)

-- Markers.
-- view.marker_fore[textadept.bookmarks.MARK_BOOKMARK] = colors.base00
view.marker_back[textadept.bookmarks.MARK_BOOKMARK] = colors.base0E
-- view.marker_fore[textadept.run.MARK_WARNING] = colors.base00
view.marker_back[textadept.run.MARK_WARNING] = colors.base07
-- view.marker_fore[textadept.run.MARK_ERROR] = colors.base00
view.marker_back[textadept.run.MARK_ERROR] = colors.base08
view.marker_fore[view.MARKNUM_HISTORY_MODIFIED] = colors.base07
view.marker_back[view.MARKNUM_HISTORY_MODIFIED] = colors.base07
view.marker_fore[view.MARKNUM_HISTORY_SAVED] = colors.base0B
view.marker_back[view.MARKNUM_HISTORY_SAVED] = colors.base0B
view.marker_fore[view.MARKNUM_HISTORY_REVERTED_TO_MODIFIED] = colors.base07
view.marker_back[view.MARKNUM_HISTORY_REVERTED_TO_MODIFIED] = colors.base07
view.marker_fore[view.MARKNUM_HISTORY_REVERTED_TO_ORIGIN] = colors.base07
view.marker_back[view.MARKNUM_HISTORY_REVERTED_TO_ORIGIN] = colors.base07
for i = view.MARKNUM_FOLDEREND, view.MARKNUM_FOLDEROPEN do -- fold margin
	view.marker_fore[i] = colors.base00
	view.marker_back[i] = colors.base03
	view.marker_back_selected[i] = colors.base05
end

-- Indicators.
view.indic_fore[ui.find.INDIC_FIND] = colors.base07
view.indic_alpha[ui.find.INDIC_FIND] = 0x80
view.indic_fore[textadept.editing.INDIC_HIGHLIGHT] = colors.base01
view.indic_alpha[textadept.editing.INDIC_HIGHLIGHT] = 0x80
view.indic_fore[textadept.snippets.INDIC_PLACEHOLDER] = colors.base05
view.indic_fore[textadept.run.INDIC_WARNING] = colors.base07
view.indic_fore[textadept.run.INDIC_ERROR] = colors.base08
view.indic_fore[view.INDICATOR_HISTORY_MODIFIED_INSERTION] = colors.base0B
view.indic_fore[view.INDICATOR_HISTORY_MODIFIED_DELETION] = colors.base08
view.indic_fore[view.INDICATOR_HISTORY_SAVED_INSERTION] = colors.base0B
view.indic_fore[view.INDICATOR_HISTORY_SAVED_DELETION] = colors.base08
view.indic_fore[view.INDICATOR_HISTORY_REVERTED_TO_MODIFIED_INSERTION] = colors.base0B
view.indic_fore[view.INDICATOR_HISTORY_REVERTED_TO_MODIFIED_DELETION] = colors.base08
view.indic_fore[view.INDICATOR_HISTORY_REVERTED_TO_ORIGIN_INSERTION] = colors.base0B
view.indic_fore[view.INDICATOR_HISTORY_REVERTED_TO_ORIGIN_DELETION] = colors.base08

-- Call tips.
view.call_tip_fore_hlt = colors.base0E

-- Long Lines.
view.edge_color = colors.base02

-- Find & replace pane entries.
ui.find.entry_font = font .. ' ' .. size

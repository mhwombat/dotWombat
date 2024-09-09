-- Base16 Theme: base16-amy
-- Theme author: Amy de Buitléir
-- Template adapted from Textadept's default templates

local base16
base16 = {}

local view, colors, styles = view, view.colors, view.styles

-- Base16 colors
base16.base00 = 0x
base16.base01 = 0x
base16.base02 = 0x
base16.base03 = 0x -- unused
base16.base04 = 0x
base16.base05 = 0x -- unused
base16.base06 = 0x
base16.base07 = 0x
base16.base08 = 0x
base16.base09 = 0x
base16.base0A = 0x
base16.base0B = 0x
base16.base0C = 0x
base16.base0D = 0x
base16.base0E = 0x
base16.base0F = 0x


-- Default font.
if not font then font = WIN32 and 'Consolas' or OSX and 'Monaco' or 'Monospace' end
if not size then size = not OSX and 10 or 12 end

-- Predefined styles.
styles[view.STYLE_DEFAULT] = {
	font = font, size = size, fore = base16.base04, back = base16.base00
}
styles[view.STYLE_LINENUMBER] = {fore = base16.base02, back = base16.base00}
styles[view.STYLE_BRACELIGHT] = {fore = base16.base0C, bold = true}
styles[view.STYLE_BRACEBAD] = {fore = base16.base06}
-- styles[view.STYLE_CONTROLCHAR] = {}
styles[view.STYLE_INDENTGUIDE] = {fore = base16.base01}
styles[view.STYLE_CALLTIP] = {fore = base16.base04, back = base16.base01}
styles[view.STYLE_FOLDDISPLAYTEXT] = {fore = base16.base02, back = base16.base01}

-- Tag styles.
styles[lexer.ANNOTATION] = {fore = base16.base0F}
styles[lexer.ATTRIBUTE] = {fore = base16.base0D}
styles[lexer.BOLD] = {bold = true}
styles[lexer.CLASS] = {fore = base16.base08}
styles[lexer.CODE] = {fore = base16.base02, eol_filled = true}
styles[lexer.COMMENT] = {fore = base16.base02}
-- styles[lexer.CONSTANT] = {}
styles[lexer.CONSTANT_BUILTIN] = {fore = base16.base0E}
styles[lexer.EMBEDDED] = {fore = base16.base0E}
styles[lexer.ERROR] = {fore = base16.base06}
-- styles[lexer.FUNCTION] = {}
styles[lexer.FUNCTION_BUILTIN] = {fore = base16.base07}
-- styles[lexer.FUNCTION_METHOD] = {}
styles[lexer.HEADING] = {fore = base16.base0F}
-- styles[lexer.IDENTIFIER] = {}
styles[lexer.ITALIC] = {italic = true}
styles[lexer.KEYWORD] = {fore = base16.base0C}
styles[lexer.LABEL] = {fore = base16.base0F}
styles[lexer.LINK] = {underline = true}
styles[lexer.LIST] = {fore = base16.base0B}
styles[lexer.NUMBER] = {fore = base16.base0B}
-- styles[lexer.OPERATOR] = {}
styles[lexer.PREPROCESSOR] = {fore = base16.base0F}
styles[lexer.REFERENCE] = {underline = true}
styles[lexer.REGEX] = {fore = base16.base09}
styles[lexer.STRING] = {fore = base16.base0A}
styles[lexer.TAG] = {fore = base16.base0C}
styles[lexer.TYPE] = {fore = base16.base0D}
styles[lexer.UNDERLINE] = {underline = true}
-- styles[lexer.VARIABLE] = {}
styles[lexer.VARIABLE_BUILTIN] = {fore = base16.base08}
-- styles[lexer.WHITESPACE] = {}

-- CSS.
styles.property = styles[lexer.ATTRIBUTE]
-- styles.pseudoclass = {}
-- styles.pseudoelement = {}
-- Diff.
styles.addition = {fore = base16.base0A}
styles.deletion = {fore = base16.base06}
styles.change = {fore = base16.base08}
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
-- Python.
styles.keyword_soft = {}
-- XML.
-- styles.cdata = {}
-- YAML.
styles.error_indent = {back = base16.base06}

-- Element colors.
-- view.element_color[view.ELEMENT_SELECTION_TEXT] = base16.base04
view.element_color[view.ELEMENT_SELECTION_BACK] = base16.base01
-- view.element_color[view.ELEMENT_SELECTION_ADDITIONAL_TEXT] = base16.base04
view.element_color[view.ELEMENT_SELECTION_ADDITIONAL_BACK] = base16.base01
-- view.element_color[view.ELEMENT_SELECTION_SECONDARY_TEXT] = base16.base04
view.element_color[view.ELEMENT_SELECTION_SECONDARY_BACK] = base16.base01
-- view.element_color[view.ELEMENT_SELECTION_INACTIVE_TEXT] = base16.base04
view.element_color[view.ELEMENT_SELECTION_INACTIVE_BACK] = base16.base01
-- view.element_color[view.ELEMENT_SELECTION_INACTIVE_ADDITIONAL_TEXT] = base16.base04
view.element_color[view.ELEMENT_SELECTION_INACTIVE_ADDITIONAL_BACK] = base16.base01
view.element_color[view.ELEMENT_CARET] = base16.base04
-- view.element_color[view.ELEMENT_CARET_ADDITIONAL] =
if view ~= ui.command_entry then
	view.element_color[view.ELEMENT_CARET_LINE_BACK] = base16.base01 | 0x80000000
end
view.caret_line_layer = view.LAYER_UNDER_TEXT

-- Fold Margin.
view:set_fold_margin_color(true, base16.base00)
view:set_fold_margin_hi_color(true, base16.base00)

-- Markers.
-- view.marker_fore[textadept.bookmarks.MARK_BOOKMARK] = base16.base00
view.marker_back[textadept.bookmarks.MARK_BOOKMARK] = base16.base0C
-- view.marker_fore[textadept.run.MARK_WARNING] = base16.base00
view.marker_back[textadept.run.MARK_WARNING] = base16.base08
-- view.marker_fore[textadept.run.MARK_ERROR] = base16.base00
view.marker_back[textadept.run.MARK_ERROR] = base16.base06
for i = view.MARKNUM_FOLDEREND, view.MARKNUM_FOLDEROPEN do -- fold margin
	view.marker_fore[i] = base16.base00
	view.marker_back[i] = base16.base02
	view.marker_back_selected[i] = base16.base04
end

-- Indicators.
view.indic_fore[ui.find.INDIC_FIND] = base16.base08
view.indic_alpha[ui.find.INDIC_FIND] = 0x80
view.indic_fore[textadept.editing.INDIC_HIGHLIGHT] = base16.base07
view.indic_alpha[textadept.editing.INDIC_HIGHLIGHT] = 0x80
view.indic_fore[textadept.snippets.INDIC_PLACEHOLDER] = base16.base04
view.indic_fore[textadept.run.INDIC_WARNING] = base16.base08
view.indic_fore[textadept.run.INDIC_ERROR] = base16.base06

-- Call tips.
view.call_tip_fore_hlt = base16.base0C

-- Long Lines.
view.edge_color = base16.base01

-- Find & replace pane entries.
ui.find.entry_font = font .. ' ' .. size

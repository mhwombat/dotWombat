--require('textredux').hijack()

local lsp = require('lsp')

-- require 'theme'
view:set_theme(not CURSES and 'base16-amy' or 'term')

--[[

Hydra key bindings

I try to replace key combinations with key sequences.
Everything starts with the context menu key, which launches the main hydra.
From there, the desired action is selected from sub-hydras and sub-sub-hydras.

I can still access the default context menu by pressing Shift+F10.
--]]

local hydra = require('hydra')

-- Use these synonyms to access functions that are defined in the menus but
-- not provided by the API.
local m_edit = textadept.menu.menubar[_L['Edit']]
local m_sel = m_edit[_L['Select']]

local file_hydra = {
  { key='n', help='new', action=buffer.new },
  { key='o', help='open', action=io.open_file },
  { key='r', help='open recent', action=io.open_recent_file },
  { key='s', help='save', action=buffer.save },
  { key='S', help='save as', action=buffer.save_as },
  { key='c', help='close', action=buffer.close },
  { key='R', help='reload', action=buffer.reload },
  { key="*", help="save All", action=io.save_all_files },
  --{ key="?", help="close All", action=io.close_all_buffers },
  --{ key="?", help="load Session...", action=textadept.session.load },
  --{ key="?", help="save Session...", action=textadept.session.save },
  { key="q", help="quit", action=quit },
}

local case_hydra = {
  { key='up', help='upper case selection', action=buffer.upper_case },
  { key='down', help='lower case selection', action=buffer.lower_case },
}

local enclose_hydra = {
  --{ key='X', help='enclose as xml tags', action=m_sel[_L['Enclose as XML Tags']][2] },
  { key='x', help='enclose as single xml tag', action=function() enc('<', ' />') end },
  { key="'", help='enclose in single quotes', action=function() enc("'", "'") end },
  { key='"', help='enclose in double quotes', action=function() enc('"', '"') end },
  { key='(', help='enclose in parentheses', action=function() enc('(', ')') end },
  { key='[', help='enclose in brackets', action=function() enc('[', ']') end },
  { key='{', help='enclose in braces', action=function() enc('{', ' }') end},
}

local history_hydra = {
  { key='left', help='navigate backward', action=textadept.history.back },
  { key='right', help='navigate forward', action=textadept.history.forward },
  { key='r', help='record location', action=textadept.history.record },
  { key='c', help='clear history', action=textadept.history.clear },
}

local edit_hydra = {
  { key='u', help='undo', action=buffer.undo },
  { key='r', help='redo', action=buffer.redo },
  { key='del', help='cut', action=buffer.cut },
  { key='c', help='copy', action=buffer.copy },
  { key='p', help='paste', action=buffer.paste },
  { key='r', help='paste reindent', action=textadept.editing.paste_reindent },
  { key='2', help='duplicate', action=buffer.selection_duplicate },
  { key='x', help='delete', action=buffer.clear },
  { key='#', help='toggle block comment', action=textadept.editing.toggle_comment },
  { key='t', help='transpose characters', action=textadept.editing.transpose_chars },
  { key='j', help='join lines', action=textadept.editing.join_lines },
  { key='|', 
    help='pipe to bash', 
    action=function()
             ui.command_entry.run(textadept.editing.filter_through, 'bash')
           end },
  { key='C', help='case...', action=case_hydra },
  { key='e', help='enclose...', action=enclose_hydra },
  { key='h', help='history...', action=history_hydra },
  { key='up', help='move selected lines up', action=buffer.move_selected_lines_up },
  { key='down', help='move selected lines down', action=buffer.move_selected_lines_down },
  --{ key='?', help='preferences', action=function() io.open_file(_userhome .. '/init.lua') end }
}

local select_hydra = {
  { key='*', help='all', action=buffer.select_all },
  { key='[', help='between delimiters', action=sel_enc },
  { key='<', help='between XML Tags', action=function() sel_enc('>', '<') end },
  { key=' ', help='in XML Tag', action=function() sel_enc('<', '>') end },
  { key='w', help='word', action=textadept.editing.select_word },
  { key='l', help='line', action=textadept.editing.select_line },
  { key='p', help='paragraph', action=textadept.editing.select_paragraph },
}

local search_hydra = {
  { key='f', help='find', action=ui.find.focus },
  { key='right', help='find next', action=ui.find.find_next },
  { key='left', help='find previous', action=ui.find.find_prev },
  { key='r', help='replace', action=ui.find.replace },
  { key='a', help='replace all', action=ui.find.replace_all },
  { key='i', help='find incremental', action=function() ui.find.focus{incremental = true } end},
  { key='F', help='find in files', action=function() ui.find.focus{in_files = true } end},
  { key='shift+right', help='goto next file found', action=function() ui.find.goto_file_found(true) end },
  { key='shift+left', help='goto previous file found', action=function() ui.find.goto_file_found(false) end },
  { key='j', help='jump to', action=textadept.editing.goto_line },
}

local word_hydra = {
  { key='left', help='prev', action=buffer.word_left, persistent=true },
  { key='right', help='next', action=buffer.word_right, persistent=true },
  { key='shift+right', help='extend selection', action=buffer.word_right_extend, persistent=true },
  { key='shift+left', help='shrink selection', action=buffer.word_left_extend, persistent=true },
}

local tab_hydra = {
  { key='2', help='tab width: 2', action=function() set_indentation(2) end },
  { key='3', help='tab width: 3', action=function() set_indentation(3) end },
  { key='4', help='tab width: 4', action=function() set_indentation(4) end },
  { key='8', help='tab width: 8', action=function() set_indentation(8) end },
  --{ key='u', help='toggle use tabs', action=function()
  { key='c', help='convert indentation', action=textadept.editing.convert_indentation },
}

local encoding_hydra = {
  { key='8', help='utf-8 encoding', action=function() set_encoding('utf-8') end },
  { key='A', help='ascii encoding', action=function() set_encoding('ascii') end },
  { key='1', help='cp-1252 encoding', action=function() set_encoding('cp1252') end },
  { key='u', help='utf-16 encoding', action=function() set_encoding('utf-16le') end },
}

local buffer_hydra = {
  { key='right', help='next buffer', action=function() view:goto_buffer(1) end },
  { key='left', help='previous buffer', action=function() view:goto_buffer(-1) end },
  { key='g', help='go to buffer...', action=ui.switch_buffer },
  { key='t', help='tab...', action=tab_hydra },
  { key='e', help='encoding...', action=encoding_hydra },
  { key='C', help='crlf', action=function() set_eol_mode(buffer.eol_crlf) end },
  { key='L', help='lf', action=function() set_eol_mode(buffer.eol_lf) end },
  --{ key='w', help='toggle wrap mode', action=function()
  --{ key=' ', help='toggle view whitespace', action=function()
  { key='l', help='select lexer...', action=textadept.file_types.select_lexer },
}

local view_hydra = {
  { key='right', help='next view', action=function() ui.goto_view(1) end },
  { key='left', help='previous view', action=function() ui.goto_view(-1) end },
  { key='-', help='split view horizontal', action=function() view:split() end },
  { key='|', help='split view vertical', action=function() view:split(true) end },
  { key='u', help='unsplit view', action=function() view:unsplit() end },
  { key='U', help='unsplit all views', action=function() while view:unsplit() do end end },
  --{ key='?', help='grow view', action=function()
  --{ key='?', help='shrink view', action=function()
  --{ key='?', help='toggle current fold', action=function()
  --{ key='?', help='toggle show indent guides', action=function()
  --{ key='?', help='toggle virtual space', action=function()
  { key='+', help='zoom in', action=view.zoom_in },
  { key='-', help='zoom out', action=view.zoom_out },
  { key='1', help='reset zoom', action=function() view.zoom = 0 end },
}

local lsp_hydra = {
  --{ key='?', help='command entry', action=ui.command_entry.run },
  --{ key='?', help='select command', action=function() m.select_command() end },
  --{ key='?', help='run', action=textadept.run.run },
  --{ key='?', help='compile', action=textadept.run.compile },
  --{ key='?', help='set arguments...', action=textadept.run.set_arguments },
  --{ key='?', help='build', action=textadept.run.build },
  --{ key='?', help='run tests', action=textadept.run.test },
  --{ key='?', help='stop', action=textadept.run.stop },
  --{ key='?', help='next error', action=function() textadept.run.goto_error(true) end },
  --{ key='?', help='previous error', action=function() textadept.run.goto_error(false) end },
  --{ key='?', help='toggle bookmark', action=textadept.bookmarks.toggle },
  --{ key='?', help='clear bookmarks', action=textadept.bookmarks.clear },
  --{ key='?', help='next bookmark', action=function() textadept.bookmarks.goto_mark(true) end },
  --{ key='?', help='previous bookmark', action=function() textadept.bookmarks.goto_mark(false) end },
  --{ key='?', help='goto bookmark...', action=textadept.bookmarks.goto_mark },
  --{ key='?', help='start/stop recording', action=textadept.macros.record },
  --{ key='?', help='play', action=textadept.macros.play },
  --{ key='?', help='save...', action=textadept.macros.save },
  --{ key='?', help='load...', action=textadept.macros.load },
  --{ key='?', help='quickly open user home', action=function() io.quick_open(_userhome) end },
  --{ key='?', help='quickly open textadept home', action=function() io.quick_open(_home) end },
  --{ key='?', help='quickly open current directory', action=function()
  --{ key='?', help='quickly open current project', action=io.quick_open },
  --{ key='?', help='insert snippet...', action=textadept.snippets.select },
  --{ key='?', help='expand snippet/next placeholder', action=textadept.snippets.insert },
  --{ key='?', help='previous snippet placeholder', action=textadept.snippets.previous },
  --{ key='?', help='cancel snippet', action=textadept.snippets.cancel_current },
  --{ key='?', help='complete trigger word', action=function() textadept.editing.autocomplete('snippets') end }
  --{ key='?', help='complete symbol', action=function() textadept.editing.autocomplete(buffer:get_lexer(true)) end },
  --{ key='?', help='show documentation', action=textadept.editing.show_documentation },
  --{ key='?', help='show style', action=function()
}

local help_hydra = {
  { key='m', help='show manual', action=function() open_page(_home .. '/docs/manual.html') end },
  { key='l', help='show luadoc', action=function() open_page(_home .. '/docs/api.html') end },
  { key='a', help='about', action=function()
      ui.dialogs.msgbox{
        title = 'Textadept', text = _RELEASE, informative_text = _COPYRIGHT,
        icon_file = _HOME .. '/core/images/ta_64x64.png'
      }
    end}
}

local main_hydra = {
  { key='f', help='file...', action=file_hydra },
  { key='b', help='buffer...', action=buffer_hydra },
  { key='v', help='view...', action=view_hydra },
  { key='w', help='word...', action=word_hydra },
  { key='e', help='edit...', action=edit_hydra },
  { key='s', help='select...', action=select_hydra },
  { key='l', help='LSP...', action=lsp_hydra },
  { key='h', help='help...', action=help_hydra },
  { key=' ', help='complete word', action=function() textadept.editing.autocomplete('word') end },
  { key='?', help='debug hydra', action=hydra.print_keys },
}

hydra.keys = {
  { key='menu', action=main_hydra }
}








  
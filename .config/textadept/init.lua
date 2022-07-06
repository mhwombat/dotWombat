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

local function raw(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. raw(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

-- Use these synonyms to access functions that are defined in the menus but
-- not provided by the API.
local m_edit = textadept.menu.menubar[_L['Edit']]
local m_sel = m_edit[_L['Select']]

local function enclose_xml_tags()
  print("DEBUG " .. raw(m_sel))
  print("DEBUG " .. raw(m_sel[_L['Enclose as XML Tags']]))
  print("DEBUG " .. raw(m_sel[_L['Enclose as XML Tags']][2]))
end

local file_hydra = {
  { key='n', help='new', action=buffer.new },
  { key='o', help='open', action=io.open_file },
  { key='r', help='open recent', action=io.open_recent_file },
  { key='s', help='save', action=buffer.save },
  { key='S', help='save as', action=buffer.save_as },
  { key='c', help='close', action=buffer.close },
  { key='R', help='reload', action=buffer.reload },
  { key="A", help="save All", action=io.save_all_files }, -- TEST
  { key="C", help="close All", action=io.close_all_buffers }, -- TEST
  --{ key="?", help="load Session...", action=textadept.session.load }, --TEST
  --{ key="?", help="save Session...", action=textadept.session.save }, --TEST
  { key="q", help="quit", action=quit }, -- TEST
}

local case_hydra = {
  { key='up', help='upper case selection', action=buffer.upper_case },
  { key='down', help='lower case selection', action=buffer.lower_case },
}

local enclose_hydra = {
  { key='X', help='enclose as xml tags', action=enclose_xml_tags }, -- TEST
  { key='x', help='enclose as single xml tag', action=function() enc('<', ' />') end }, -- TEST
  { key="'", help='enclose in single quotes', action=function() enc("'", "'") end }, -- TEST
  { key='"', help='enclose in double quotes', action=function() enc('"', '"') end }, -- TEST
  { key='(', help='enclose in parentheses', action=function() enc('(', ')') end }, -- TEST
  { key='[', help='enclose in brackets', action=function() enc('[', ']') end }, -- TEST
  { key='{', help='enclose in braces', action=function() enc('{', ' }') end}, -- TEST
}

local history_hydra = {
  { key='left', help='navigate backward', action=textadept.history.back }, -- TEST
  { key='right', help='navigate forward', action=textadept.history.forward }, -- TEST
  { key='r', help='record location', action=textadept.history.record }, -- TEST
  { key='c', help='clear history', action=textadept.history.clear }, -- TEST
}

local edit_hydra = {
  { key='u', help='undo', action=buffer.undo },
  { key='r', help='redo', action=buffer.redo },
  { key='del', help='cut', action=buffer.cut },
  { key='c', help='copy', action=buffer.copy },
  { key='p', help='paste', action=buffer.paste },
  { key='r', help='paste reindent', action=textadept.editing.paste_reindent },
  { key='2', help='duplicate', action=buffer.selection_duplicate },
  { key='shift+del', help='delete', action=buffer.clear },
  { key='#', help='toggle block comment', action=textadept.editing.toggle_comment },
  --{ key='t', help='transpose characters', action=textadept.editing.transpose_chars }, -- FIXME
  { key='j', help='join lines', action=textadept.editing.join_lines },
  --{ key='|', 
  --  help='pipe to bash', 
  --  action=function()
  --           ui.command_entry.run(textadept.editing.filter_through, 'bash')
  --         end }, -- FIXME
  --{ key='C', help='case...', action=case_hydra }, -- FIXME
  --{ key='e', help='enclose...', action=enclose_hydra }, -- FIXME
  --{ key='h', help='history...', action=history_hydra }, -- FIXME
  --{ key='up', help='move selected lines up', action=buffer.move_selected_lines_up }, -- FIXME
  --{ key='down', help='move selected lines down', action=buffer.move_selected_lines_down }, -- FIXME
  --{ key='P', help='preferences', action=function() io.open_file(_userhome .. '/init.lua') end }, -- FIXME
}

local select_hydra = {
  { key='*', help='all', action=buffer.select_all },
  { key='[', help='between delimiters', action=sel_enc }, -- FIXME
  { key='<', help='between XML Tags', action=function() sel_enc('>', '<') end }, -- FIXME
  { key=' ', help='in XML Tag', action=function() sel_enc('<', '>') end }, -- FIXME
  { key='w', help='word', action=textadept.editing.select_word },
  { key='l', help='line', action=textadept.editing.select_line },
  { key='p', help='paragraph', action=textadept.editing.select_paragraph },
}

local search_hydra = {
  { key='f', help='find', action=ui.find.focus }, -- TEST
  { key='right', help='find next', action=ui.find.find_next }, -- TEST
  { key='left', help='find previous', action=ui.find.find_prev }, -- TEST
  { key='r', help='replace', action=ui.find.replace }, -- TEST
  { key='a', help='replace all', action=ui.find.replace_all }, -- TEST
  { key='i', help='find incremental', action=function() ui.find.focus{incremental = true } end}, -- TEST
  { key='F', help='find in files', action=function() ui.find.focus{in_files = true } end}, -- TEST
  { key='shift+right', help='goto next file found', action=function() ui.find.goto_file_found(true) end }, -- TEST
  { key='shift+left', help='goto previous file found', action=function() ui.find.goto_file_found(false) end }, -- TEST
  { key='j', help='jump to', action=textadept.editing.goto_line }, -- TEST
}

local word_hydra = {
  { key='left', help='prev', action=buffer.word_left, persistent=true },
  { key='right', help='next', action=buffer.word_right, persistent=true },
  { key='shift+right', help='extend selection', action=buffer.word_right_extend, persistent=true },
  { key='shift+left', help='shrink selection', action=buffer.word_left_extend, persistent=true },
}

local tab_hydra = {
  { key='2', help='tab width: 2', action=function() set_indentation(2) end }, -- FIXME
  { key='3', help='tab width: 3', action=function() set_indentation(3) end }, -- FIXME
  { key='4', help='tab width: 4', action=function() set_indentation(4) end }, -- FIXME
  { key='8', help='tab width: 8', action=function() set_indentation(8) end }, -- FIXME
  --{ key='u', help='toggle use tabs', action=??? }, -- FIXME
  { key='c', help='convert indentation', action=textadept.editing.convert_indentation }, -- FIXME
}

local encoding_hydra = {
  { key='8', help='utf-8 encoding', action=function() set_encoding('utf-8') end }, -- FIXME
  { key='A', help='ascii encoding', action=function() set_encoding('ascii') end }, -- FIXME
  { key='1', help='cp-1252 encoding', action=function() set_encoding('cp1252') end }, -- FIXME
  { key='u', help='utf-16 encoding', action=function() set_encoding('utf-16le') end }, -- FIXME
}

local buffer_hydra = {
  { key='right', help='next buffer', action=function() view:goto_buffer(1) end, persistent=true },
  { key='left', help='previous buffer', action=function() view:goto_buffer(-1) end, persistent=true },
  { key='g', help='go to buffer...', action=ui.switch_buffer },
  { key='t', help='tab...', action=tab_hydra },
  { key='e', help='encoding...', action=encoding_hydra },
  { key='C', help='crlf', action=function() set_eol_mode(buffer.eol_crlf) end }, -- FIXME
  { key='L', help='lf', action=function() set_eol_mode(buffer.eol_lf) end }, -- FIXME
  --{ key='w', help='toggle wrap mode', action=FINISH }, -- TEST
  --{ key=' ', help='toggle view whitespace', action=FINISH }, --TEST
  { key='l', help='select lexer...', action=textadept.file_types.select_lexer },
}

local view_hydra = {
  { key='right', help='next view', action=function() ui.goto_view(1) end },
  { key='left', help='previous view', action=function() ui.goto_view(-1) end },
  { key='_', help='split view horizontal', action=function() view:split() end },
  { key='|', help='split view vertical', action=function() view:split(true) end },
  { key='u', help='unsplit view', action=function() view:unsplit() end }, -- TEST
  --{ key='U', help='unsplit all views', action=function() while view:unsplit() do end end }, -- FIXME
  --{ key='g', help='grow view', action=FINISH }, --TEST
  --{ key='s', help='shrink view', action=FINISH }, --TEST
  --{ key='?', help='toggle current fold', action=FINISH }, --TEST
  --{ key='?', help='toggle show indent guides', action=FINISH }, --TEST
  --{ key='?', help='toggle virtual space', action=FINISH }, --TEST
  { key='+', help='zoom in', action=view.zoom_in },
  { key='-', help='zoom out', action=view.zoom_out },
  { key='1', help='reset zoom', action=function() view.zoom = 0 end },
}

local bookmark_hydra = {
  { key='x', help='just testing', action=hydra.print_keys },
  --{ key='B', help='toggle bookmark', action=textadept.bookmarks.toggle }, --TEST
  --{ key='C', help='clear bookmarks', action=textadept.bookmarks.clear }, --TEST
  --{ key='shift+right', help='next bookmark', action=function() textadept.bookmarks.goto_mark(true) end }, --TEST
  --{ key='shift+left', help='previous bookmark', action=function() textadept.bookmarks.goto_mark(false) end }, --TEST
  --{ key='g', help='goto bookmark...', action=textadept.bookmarks.goto_mark }, --TEST
}

local macro_hydra = {
  { key='x', help='just testing', action=hydra.print_keys },
  --{ key='?', help='start/stop recording', action=textadept.macros.record }, --TEST
  --{ key='?', help='play', action=textadept.macros.play }, --TEST
  --{ key='?', help='save...', action=textadept.macros.save }, --TEST
  --{ key='?', help='load...', action=textadept.macros.load }, --TEST
}

local quick_open_hydra = {
  { key='x', help='just testing', action=hydra.print_keys },
  --{ key='?', help='quickly open user home', action=function() io.quick_open(_userhome) end }, --TEST
  --{ key='?', help='quickly open textadept home', action=function() io.quick_open(_home) end }, --TEST
  --{ key='?', help='quickly open current directory', action=FINISH }, --TEST
  --{ key='?', help='quickly open current project', action=io.quick_open }, --TEST
}

local snippet_hydra = {
  { key='x', help='just testing', action=hydra.print_keys },
  --{ key='?', help='insert snippet...', action=textadept.snippets.select }, --TEST
  --{ key='?', help='expand snippet/next placeholder', action=textadept.snippets.insert }, --TEST
  --{ key='?', help='previous snippet placeholder', action=textadept.snippets.previous }, --TEST
  --{ key='?', help='cancel snippet', action=textadept.snippets.cancel_current }, --TEST
}

local lsp_hydra = {
  --{ key='?', help='command entry', action=ui.command_entry.run }, --TEST
  --{ key='?', help='select command', action=function() m.select_command() end }, --TEST
  { key='r', help='run', action=textadept.run.run },
  { key='c', help='compile', action=textadept.run.compile },
  { key='R', help='set arguments...', action=textadept.run.set_arguments },
  { key='b', help='build', action=textadept.run.build },
  { key='t', help='run tests', action=textadept.run.test },
  --{ key='?', help='stop', action=textadept.run.stop }, --TEST
  { key='right', help='next error', action=function() textadept.run.goto_error(true) end }, --TEST
  { key='left', help='previous error', action=function() textadept.run.goto_error(false) end }, --TEST
  { key='S', help='server...', action=FINISH }, -- TEST
  { key='B', help='bookmarks...', action=bookmark_hydra }, -- TEST
  { key='m', help='macros...', action=macro_hydra }, -- TEST
  { key='q', help='snippets...', action=quick_open_hydra }, -- TEST
  { key='s', help='snippets...', action=snippet_hydra }, -- TEST
  --{ key='?', help='complete trigger word', action=function() textadept.editing.autocomplete('snippets') end }
  --{ key='?', help='complete symbol', action=function() textadept.editing.autocomplete(buffer:get_lexer(true)) end }, --TEST
  --{ key='?', help='show documentation', action=textadept.editing.show_documentation }, --TEST
  --{ key='?', help='show style', action=FINISH }, --TEST
}

local help_hydra = {
  { key='m', help='show manual', action=function() open_page(_home .. '/docs/manual.html') end }, -- TEST
  { key='l', help='show luadoc', action=function() open_page(_home .. '/docs/api.html') end }, -- TEST
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
  { key='x', help='test hydra', action=case_hydra },
}

hydra.keys = {
  { key='menu', action=main_hydra }
}

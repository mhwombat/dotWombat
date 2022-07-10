--textredux = require 'textredux'
local lsp = require('lsp')

-- require 'theme'
view:set_theme(not CURSES and 'base16-amy' or 'term')

-- >>> IGNORE THIS STUFF; I'M EXPERIMENTING
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

local function dump(leader, t)
  ui.print(t)
  ui.print(raw(t))
  for k,v in pairs(t) do
    ui.print(k)
    s = leader .. k .. ': '
    if type(v) == 'table' then
      ui.print(s)
      dump(leader .. '  ', v)
    else
      ui.print(s .. tostring(v))
    end
  end
  ui.print('wombat')
end
-- <<< END IGNORE

local function open_page(url)
  local cmd = (WIN32 and 'start ""') or (OSX and 'open') or 'xdg-open'
  print('DEBUG open_page calling: ' .. string.format('%s "%s"', cmd, not OSX and url or 'file://' .. url))
  os.spawn(string.format('%s "%s"', cmd, not OSX and url or 'file://' .. url))
end

--[[

Hydra key bindings

I try to replace key combinations with key sequences.
Everything starts with the context menu key, which launches the main hydra.
From there, the desired action is selected from sub-hydras and sub-sub-hydras.

I can still access the default context menu by pressing Shift+F10.
--]]

local hydra = require('hydra')

-- file hydras

local file_hydra = hydra.create({
  { key='n', help='new', action=buffer.new },
  { key='o', help='open', action=io.open_file },
  --{ key='o', help='open', action=textredux.fs.open_file },
  { key='r', help='open recent', action=io.open_recent_file },
  { key='s', help='save', action=buffer.save },
  { key='a', help='save as', action=buffer.save_as },
  { key='c', help='close', action=buffer.close },
  { key='R', help='reload', action=buffer.reload },
  { key="S", help="save All", action=io.save_all_files }, -- FIXME
  { key="C", help="close All", action=io.close_all_buffers },
})

-- buffer hydras

local tab_hydra = hydra.create({
  { key='2', help='tab width: 2', action=function() set_indentation(2) end }, -- FIXME
  { key='3', help='tab width: 3', action=function() set_indentation(3) end }, -- FIXME
  { key='4', help='tab width: 4', action=function() set_indentation(4) end }, -- FIXME
  { key='8', help='tab width: 8', action=function() set_indentation(8) end }, -- FIXME
  --{ key='u', help='toggle use tabs', action=??? }, -- FIXME
  { key='c', help='convert indentation', action=textadept.editing.convert_indentation }, -- FIXME
})

local encoding_hydra = hydra.create({
  { key='8', help='utf-8 encoding', action=function() set_encoding('utf-8') end }, -- FIXME
  { key='A', help='ascii encoding', action=function() set_encoding('ascii') end }, -- FIXME
  { key='1', help='cp-1252 encoding', action=function() set_encoding('cp1252') end }, -- FIXME
  { key='u', help='utf-16 encoding', action=function() set_encoding('utf-16le') end }, -- FIXME
})

local buffer_hydra = hydra.create({
  { key='right', help='next buffer', action=function() view:goto_buffer(1) end, persistent=true },
  { key='left', help='previous buffer', action=function() view:goto_buffer(-1) end, persistent=true },
  { key='g', help='go to buffer', action=ui.switch_buffer },
  { key='t', help='tab', action=tab_hydra },
  { key='e', help='encoding', action=encoding_hydra },
  { key='C', help='crlf', action=function() set_eol_mode(buffer.eol_crlf) end }, -- FIXME
  { key='L', help='lf', action=function() set_eol_mode(buffer.eol_lf) end }, -- FIXME
  --{ key='w', help='toggle wrap mode', action=FINISH }, -- FIXME
  --{ key=' ', help='toggle view whitespace', action=FINISH }, --FIXME
  { key='l', help='select lexer', action=textadept.file_types.select_lexer },
})

-- view hydras

local view_hydra = hydra.create({
  { key='right', help='next view', action=function() ui.goto_view(1) end, persistent=true },
  { key='left', help='previous view', action=function() ui.goto_view(-1) end, persistent=true },
  { key='_', help='split view horizontal', action=function() view:split() end },
  { key='|', help='split view vertical', action=function() view:split(true) end },
  { key='u', help='unsplit view', action=function() view:unsplit() end }, -- TEST
  --{ key='U', help='unsplit all views', action=function() while view:unsplit() do end end }, -- FIXME
  --{ key='g', help='grow view', action=FINISH }, -- TEST
  --{ key='s', help='shrink view', action=FINISH }, -- TEST
  --{ key='?', help='toggle current fold', action=FINISH }, -- TEST
  --{ key='?', help='toggle show indent guides', action=FINISH }, -- TEST
  --{ key='?', help='toggle virtual space', action=FINISH }, -- TEST
  { key='+', help='zoom in', action=view.zoom_in, persistent=true },
  { key='-', help='zoom out', action=view.zoom_out, persistent=true },
  { key='1', help='reset zoom', action=function() view.zoom = 0 end },
})

-- navigation hydras

local word_hydra = hydra.create({
  { key='left', help='prev', action=buffer.word_left, persistent=true },
  { key='right', help='next', action=buffer.word_right, persistent=true },
  { key='shift+right', help='extend selection', action=buffer.word_right_extend, persistent=true },
  { key='shift+left', help='shrink selection', action=buffer.word_left_extend, persistent=true },
})

local bookmark_hydra = hydra.create({
  { key='b', help='toggle bookmark', action=textadept.bookmarks.toggle, persistent=true },
  { key='c', help='clear bookmarks', action=textadept.bookmarks.clear, persistent=true },
  { key='right', help='next bookmark', action=function() textadept.bookmarks.goto_mark(true) end, persistent=true },
  { key='left', help='previous bookmark', action=function() textadept.bookmarks.goto_mark(false) end, persistent=true },
  { key='g', help='goto bookmark', action=textadept.bookmarks.goto_mark, persistent=true },
})

local navigation_hydra = hydra.create({
  { key='w', help='word', action=word_hydra },
  { key='b', help='bookmarks', action=bookmark_hydra },
})

-- search hydras

local search_hydra = hydra.create({
  { key='f', help='find', action=ui.find.focus }, -- TODO revamp to work more smoothly with hydra
  { key='right', help='find next', action=ui.find.find_next, persistent=true  },
  { key='left', help='find previous', action=ui.find.find_prev, persistent=true },
  { key='r', help='replace', action=ui.find.replace, persistent=true  }, -- TODO revamp
  { key='a', help='replace all', action=ui.find.replace_all }, -- TODO revamp
  { key='i', help='find incremental', action=function() ui.find.focus{incremental = true } end},
  { key='F', help='find in files', action=function() ui.find.focus{in_files = true } end},
  { key='shift+right', help='goto next file found', action=function() ui.find.goto_file_found(true) end }, -- TODO revamp
  { key='shift+left', help='goto previous file found', action=function() ui.find.goto_file_found(false) end }, -- TODO revamp
  { key='j', help='jump to', action=textadept.editing.goto_line },
})

-- editing hydras

local select_hydra = hydra.create({
  { key='*', help='all', action=buffer.select_all },
  { key='[', help='between delimiters', action=textadept.editing.select_enclosed }, -- FIXME
  { key='<', help='between XML Tags', action=function() textadept.editing.select_enclosed('>', '<') end }, -- FIXME
  { key=' ', help='in XML Tag', action=function() textadept.editing.select_enclosed('<', '>') end }, -- FIXME
  { key='w', help='word', action=textadept.editing.select_word, persistent=true },
  { key='l', help='line', action=textadept.editing.select_line, persistent=true },
  { key='p', help='paragraph', action=textadept.editing.select_paragraph, persistent=true },
})

local case_hydra = hydra.create({
  { key='up', help='upper case selection', action=buffer.upper_case, persistent=true },
  { key='down', help='lower case selection', action=buffer.lower_case, persistent=true },
})

local enclose_hydra = hydra.create({
  { key='X', help='enclose as xml tags', action=enclose_xml_tags }, -- FIXME
  { key='x', help='enclose as single xml tag', action=function() enc('<', ' />') end }, -- FIXME
  { key="'", help='enclose in single quotes', action=function() enc("'", "'") end }, -- FIXME
  { key='"', help='enclose in double quotes', action=function() enc('"', '"') end }, -- FIXME
  { key='(', help='enclose in parentheses', action=function() enc('(', ')') end }, -- FIXME
  { key='[', help='enclose in brackets', action=function() enc('[', ']') end }, -- FIXME
  { key='{', help='enclose in braces', action=function() enc('{', ' }') end}, -- FIXME
})

local macro_hydra = hydra.create({
  { key='r', help='start/stop recording', action=textadept.macros.record }, -- TEST
  { key='p', help='play', action=textadept.macros.play }, -- TEST
  { key='s', help='save', action=textadept.macros.save }, -- TEST
  { key='l', help='load', action=textadept.macros.load }, -- TEST
})

local quick_open_hydra = hydra.create({
  { key='h', help='quickly open user home', action=function() io.quick_open(_userhome) end }, -- TEST
  { key='t', help='quickly open textadept home', action=function() io.quick_open(_home) end }, -- TEST
  --{ key='d', help='quickly open current directory', action=FINISH }, --FIXME
  { key='p', help='quickly open current project', action=io.quick_open }, -- TEST
})

local snippet_hydra = hydra.create({
  { key='i', help='insert snippet', action=textadept.snippets.select }, -- TEST
  { key='x', help='expand snippet/next placeholder', action=textadept.snippets.insert }, -- TEST
  { key='left', help='previous snippet placeholder', action=textadept.snippets.previous }, -- TEST
  { key='z', help='cancel snippet', action=textadept.snippets.cancel_current }, -- TEST
})

local edit_hydra = hydra.create({
  { key='s', help='select', action=select_hydra },
  { key='u', help='undo', action=buffer.undo, persistent=true },
  { key='r', help='redo', action=buffer.redo, persistent=true },
  { key='del', help='cut', action=buffer.cut, persistent=true },
  { key='c', help='copy', action=buffer.copy },
  { key='p', help='paste', action=buffer.paste, persistent=true },
  { key='P', help='paste reindent', action=textadept.editing.paste_reindent, persistent=true },
  { key='2', help='duplicate', action=buffer.selection_duplicate, persistent=true },
  { key='shift+del', help='delete', action=buffer.clear, persistent=true },
  { key='#', help='toggle block comment', action=textadept.editing.toggle_comment, persistent=true },
  { key='t', help='transpose characters', action=textadept.editing.transpose_chars, persistent=true },
  { key='j', help='join lines', action=textadept.editing.join_lines },
  { key='|', 
    help='pipe to bash', 
    action=function()
             ui.command_entry.run(textadept.editing.filter_through, 'bash')
           end },
  { key='C', help='case', action=case_hydra },
  { key='e', help='enclose', action=enclose_hydra },
  { key='up', help='move selected lines up', action=buffer.move_selected_lines_up, persistent=true },
  { key='down', help='move selected lines down', action=buffer.move_selected_lines_down, persistent=true },
  --{ key='P', help='preferences', action=function() io.open_file(_userhome .. '/init.lua') end }, -- FIXME
  { key='m', help='macros', action=macro_hydra },
  { key='q', help='quick open', action=quick_open_hydra },
  { key='S', help='snippets', action=snippet_hydra },
  --{ key='?', help='complete trigger word', action=function() textadept.editing.autocomplete('snippets') end } -- TEST
  --{ key='?', help='complete symbol', action=function() textadept.editing.autocomplete(buffer:get_lexer(true)) end }, -- TEST
  --{ key='?', help='show documentation', action=textadept.editing.show_documentation }, -- TEST
  --{ key='?', help='show style', action=FINISH }, -- TEST
})

-- history hydras

local history_hydra = hydra.create({
  { key='left', help='navigate backward', action=textadept.history.back, persistent=true },
  { key='right', help='navigate forward', action=textadept.history.forward, persistent=true }, -- TEST
  { key='r', help='record location', action=textadept.history.record, persistent=true },
  { key='c', help='clear history', action=textadept.history.clear, persistent=true },
})

-- tool hydras

local tool_hydra = hydra.create({
  { key='\n', help='command entry', action=ui.command_entry.run },
  { key='s', help='select command', action=function() m.select_command() end, persistent=true },
  { key='r', help='run', action=textadept.run.run, persistent=true },
  { key='c', help='compile', action=textadept.run.compile, persistent=true },
  { key='R', help='set arguments', action=textadept.run.set_arguments, persistent=true },
  { key='b', help='build', action=textadept.run.build, persistent=true },
  { key='t', help='run tests', action=textadept.run.test, persistent=true },
  { key='x', help='stop', action=textadept.run.stop, persistent=true }, -- TEST
  { key='right', help='next error', action=function() textadept.run.goto_error(true) end, persistent=true }, -- TEST
  { key='left', help='previous error', action=function() textadept.run.goto_error(false) end, persistent=true }, -- TEST
  --{ key='S', help='server', action=FINISH }, -- TEST
})

-- LSP hydras

local lsp_goto_hydra = hydra.create({
  { key='w', help='go to workspace symbol', action=function() ui.print('not implemented') end }, --FIXME
  { key='s', help='go to document symbol', action=lsp.goto_symbol }, -- TEST
  { key='c', help='go to declaration', action=lsp.goto_declaration }, -- TEST
  { key='f', help='go to definition', action=lsp.goto_definition }, -- TEST
  { key='t', help='go to type definition', action=lsp.goto_type_definition }, -- TEST
  { key='i', help='go to implementation', action=lsp.goto_implementation }, -- TEST
})

local lsp_server_hydra = hydra.create({
  { key='s', help='start server', action=function() ui.print('not implemented') end }, -- FIXME
  { key='x', help='stop server', action=function() ui.print('not implemented') end }, -- FIXME
})

local lsp_hydra = hydra.create({
  { key='S', help='server', action=lsp_server_hydra },
  { key='g', help='go to', action=lsp_goto_hydra },
  { key='\n', help='autocomplete', action=function() textadept.editing.autocomplete('lsp') end }, -- TEST
  { key='h', help='show hover info', action=lsp.hover }, -- TEST
  { key='s', help='show signature help', action=lsp.signature_help }, -- TEST
  { key='r', help='find references', action=lsp.find_references }, -- TEST
  { key='a', help='select all symbol', action=lsp.select_all_symbol }, -- TEST
  { key='d', help='toggle show diagnostics', action=function() ui.print('not implemented') end }, -- TEST
})

-- help hydras

local help_hydra = hydra.create({
  { key='m', help='show manual', action=function() open_page(_HOME .. '/docs/manual.html') end }, -- FIXME
  { key='l', help='show luadoc', action=function() open_page(_HOME .. '/docs/api.html') end }, -- FIXME
  { key='a', help='about', action=function()
      ui.dialogs.msgbox{
        title = 'Textadept', text = _RELEASE, informative_text = _COPYRIGHT,
        icon_file = _HOME .. '/core/images/ta_64x64.png'
      }
    end},
  { key='d', help='debug hydra', action=hydra.print_keys },
})

-- session hydras

local session_hydra = hydra.create({
  { key="l", help="load Session", action=textadept.session.load },
  { key="s", help="save Session", action=textadept.session.save },
})

local main_hydra = hydra.create({
  { key='f', help='file', action=file_hydra },
  { key='b', help='buffer', action=buffer_hydra },
  { key='v', help='view', action=view_hydra },
  { key='n', help='navigate by', action=navigation_hydra },
  { key='s', help='search', action=search_hydra },
  { key='e', help='edit', action=edit_hydra },
  { key='h', help='history', action=history_hydra },
  { key='t', help='tools', action=tool_hydra },
  { key='l', help='LSP', action=lsp_hydra },
  { key='?', help='help', action=help_hydra },
  { key=' ', help='complete word', action=function() textadept.editing.autocomplete('word') end },
  { key='S', help='session', action=session_hydra },
  { key="q", help="quit", action=quit },
})

hydra.keys = hydra.create({
  { key='menu', help='main', action=main_hydra },
})

-- We don't need the menu bar; everything is available in a hydra
if not OSX then events.connect(events.INITIALIZED, function() textadept.menu.menubar = nil end) end
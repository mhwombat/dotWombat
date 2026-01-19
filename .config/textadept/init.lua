-- local lsp = require('lsp')

-- lsp.server_commands.haskell = 'haskell-language-server --lsp'
-- lsp.server_commands.markdown = 'markdown-oxide'

--textredux = require 'textredux'

textadept.editing.strip_trailing_spaces = true

keys['ctrl+alt+r'] = textadept.macros.record
keys['ctrl+alt+p'] = textadept.macros.play
keys['ctrl+alt+s'] = textadept.macros.save
keys['ctrl+alt+l'] = textadept.macros.load

if not CURSES then
--	view:set_theme('dark')
	view:set_theme('base24')
end

local function quick_open_dir()
  if buffer.filename then io.quick_open(buffer.filename:match('^(.+)[/\\]')) end
end

local function enclose_as_xml_tags()
  buffer:begin_undo_action()
  textadept.editing.enclose('<', '>')
  for i = 1, buffer.selections do
    local s, e = buffer.selection_n_start[i], buffer.selection_n_end[i]
    while buffer.char_at[s - 1] ~= 60 do s = s - 1 end -- '<'
    buffer:set_target_range(e, e)
    buffer:replace_target('</' .. buffer:text_range(s, e))
    buffer.selection_n_start[i], buffer.selection_n_end[i] = e, e
  end
  buffer:end_undo_action()
end

local function set_indentation(i)
  -- print('Setting tab width to', i)
  buffer.tab_width = i
  events.emit(events.UPDATE_UI, 1) -- for updating statusbar
end


local function toggle_use_tabs()
  buffer.use_tabs = not buffer.use_tabs
  events.emit(events.UPDATE_UI, 1) -- for updating statusbar
end

local function set_eol_mode(mode)
  buffer.eol_mode = mode
  buffer:convert_eols(mode)
  events.emit(events.UPDATE_UI, 1) -- for updating statusbar
end

local function set_encoding(encoding)
  buffer:set_encoding(encoding)
  events.emit(events.UPDATE_UI, 1) -- for updating statusbar
end

local function toggle_word_wrap()
  local first_visible_line = view.first_visible_line
  local display_line = view:visible_from_doc_line(first_visible_line)
  view.wrap_mode = view.wrap_mode == 0 and view.WRAP_WHITESPACE or 0
  view:line_scroll(0, first_visible_line - display_line)
end

local function toggle_view_whitespace()
  view.view_ws = view.view_ws == 0 and view.WS_VISIBLEALWAYS or 0
end

local function open_page(url)
  local cmd = (WIN32 and 'start ""') or (OSX and 'open') or 'xdg-open'
  print('DEBUG open_page calling: ' .. string.format('%s "%s"', cmd, not OSX and url or 'file://' .. url))
  os.spawn(string.format('%s "%s"', cmd, not OSX and url or 'file://' .. url))
end

local function grow_view()
  if view.size then view.size = view.size + view:text_height(1) end
end

local function shrink_view()
  if view.size then view.size = view.size - view:text_height(1) end
end

local function toggle_current_fold()
  local line = buffer:line_from_position(buffer.current_pos)
  view:toggle_fold(math.max(buffer.fold_parent[line], line))
end

local function toggle_show_indent_guides()
  view.indentation_guides = view.indentation_guides == 0 and view.IV_LOOKBOTH or 0
end

local function toggle_virtual_space()
  buffer.virtual_space_options = buffer.virtual_space_options == 0 and
    buffer.VS_USERACCESSIBLE or 0
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

local quick_open_hydra = hydra.create({
  { key='c', help='quickly open user config dir', action=function() io.quick_open(_USERHOME) end },
  { key='t', help='quickly open textadept home', action=function() io.quick_open(_HOME) end },
  { key='d', help='quickly open current directory', action=quick_open_dir },
  { key='p', help='quickly open current project', action=io.quick_open }, -- TEST
})

local file_hydra = hydra.create({
  { key='n', help='new', action=buffer.new },
  { key='o', help='open', action=io.open_file },
  --{ key='o', help='open', action=textredux.fs.open_file },
  { key='r', help='open recent', action=io.open_recent_file },
  { key='q', help='quick open', action=quick_open_hydra },
  { key='s', help='save', action=buffer.save },
  { key='a', help='save as', action=buffer.save_as },
  { key='c', help='close', action=buffer.close },
  { key='R', help='reload', action=buffer.reload },
  { key="S", help="save All", action=io.save_all_files },
  { key="C", help="close All", action=io.close_all_buffers },
})

-- buffer hydras

local tab_hydra = hydra.create({
  { key='2', help='tab width: 2', action=function() set_indentation(2) end },
  { key='3', help='tab width: 3', action=function() set_indentation(3) end },
  { key='4', help='tab width: 4', action=function() set_indentation(4) end },
  { key='8', help='tab width: 8', action=function() set_indentation(8) end },
  { key='u', help='toggle use tabs', action=toggle_use_tabs },
  { key='c', help='convert indentation', action=textadept.editing.convert_indentation },
})

local encoding_hydra = hydra.create({
  { key='8', help='utf-8 encoding', action=function() set_encoding('utf-8') end },
  { key='a', help='ascii encoding', action=function() set_encoding('ascii') end },
  { key='1', help='cp-1252 encoding', action=function() set_encoding('cp1252') end },
  { key='u', help='utf-16 encoding', action=function() set_encoding('utf-16le') end },
})

local buffer_hydra = hydra.create({
  { key='right', help='next buffer', action=function() view:goto_buffer(1) end, persistent=true },
  { key='left', help='previous buffer', action=function() view:goto_buffer(-1) end, persistent=true },
  { key='g', help='go to buffer', action=ui.switch_buffer },
  { key='t', help='tab', action=tab_hydra },
  { key='e', help='encoding', action=encoding_hydra },
  { key='\n', help='crlf', action=function() set_eol_mode(buffer.eol_crlf) end }, -- FIXME
  { key='down', help='lf', action=function() set_eol_mode(buffer.eol_lf) end }, -- FIXME
  { key='w', help='toggle wrap mode', action=toggle_word_wrap },
  { key=' ', help='toggle view whitespace', action=toggle_view_whitespace },
  -- FIXME { key='l', help='select lexer', action=textadept.file_types.select_lexer },
})

-- view hydras

local view_hydra = hydra.create({
  { key='right', help='next view', action=function() ui.goto_view(1) end, persistent=true },
  { key='left', help='previous view', action=function() ui.goto_view(-1) end, persistent=true },
  { key='_', help='split view horizontal', action=function() view:split() end },
  { key='|', help='split view vertical', action=function() view:split(true) end },
  { key='u', help='unsplit view', action=function() view:unsplit() end },
  { key='U', help='unsplit all views', action=function() while view:unsplit() do end end },
  { key='g', help='grow view', action=grow_view },
  { key='s', help='shrink view', action=shrink_view },
  { key='f', help='toggle current fold', action=toggle_current_fold },
  { key='i', help='toggle show indent guides', action=toggle_show_indent_guides },
  { key='v', help='toggle virtual space', action=toggle_virtual_space },
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

--local multicursor_hydra = hydra.create({
--  { key='a', help='add cursor', action=m_multiedit.add_position, persistent=true },
--  { key='m', help='add multiple cursors at column', action=m_multiedit.add_multiple, persistent=true },
--  { key='a', help='select all occurrences of word', action=m_multiedit.select_all, persistent=true },
--})

local select_hydra = hydra.create({
  { key='*', help='all', action=buffer.select_all },
  { key='[', help='between delimiters', action=textadept.editing.select_enclosed },
  { key='<', help='between XML Tags', action=function() textadept.editing.select_enclosed('>', '<') end },
  { key=' ', help='in XML Tag', action=function() textadept.editing.select_enclosed('<', '>') end },
  { key='w', help='word', action=textadept.editing.select_word, persistent=true },
  { key='l', help='line', action=textadept.editing.select_line, persistent=true },
  { key='p', help='paragraph', action=textadept.editing.select_paragraph, persistent=true },
})

local case_hydra = hydra.create({
  { key='up', help='upper case selection', action=buffer.upper_case, persistent=true },
  { key='down', help='lower case selection', action=buffer.lower_case, persistent=true },
})

local enclose_hydra = hydra.create({
  { key='X', help='enclose as xml tags', action=enclose_as_xml_tags },
  { key='x', help='enclose as single xml tag', action=function() textadept.editing.enclose('<', ' />') end },
  { key="'", help='enclose in single quotes', action=function() textadept.editing.enclose("'", "'") end },
  { key='"', help='enclose in double quotes', action=function() textadept.editing.enclose('"', '"') end },
  { key='(', help='enclose in parentheses', action=function() textadept.editing.enclose('(', ')') end },
  { key='[', help='enclose in brackets', action=function() textadept.editing.enclose('[', ']') end },
  { key='{', help='enclose in braces', action=function() textadept.editing.enclose('{', ' }') end},
})

--local macro_hydra = hydra.create({
--  { key='r', help='start/stop recording', action=textadept.macros.record },
--  { key='p', help='play', action=textadept.macros.play },
--  { key='s', help='save', action=textadept.macros.save },
--  { key='l', help='load', action=textadept.macros.load },
--})

local snippet_hydra = hydra.create({
  { key='i', help='insert snippet', action=textadept.snippets.select }, -- TEST
  { key='x', help='expand snippet/next placeholder', action=textadept.snippets.insert }, -- TEST
  { key='left', help='previous snippet placeholder', action=textadept.snippets.previous }, -- TEST
--  { key='z', help='cancel snippet', action=textadept.snippets.cancel_current }, -- TODO Fix
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
--  { key='t', help='transpose characters', action=textadept.editing.transpose_chars, persistent=true }, -- TODO Fix
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
  --{ key='m', help='macros', action=macro_hydra },
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
  -- FIXME { key='R', help='set arguments', action=textadept.run.set_arguments, persistent=true },
  { key='b', help='build', action=textadept.run.build, persistent=true },
  { key='t', help='run tests', action=textadept.run.test, persistent=true },
  { key='x', help='stop', action=textadept.run.stop, persistent=true }, -- TEST
  { key='right', help='next error', action=function() textadept.run.goto_error(true) end, persistent=true }, -- TEST
  { key='left', help='previous error', action=function() textadept.run.goto_error(false) end, persistent=true }, -- TEST
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

-- hydras I'm experimenting with

local chameleon1_hydra = hydra.create({
  { key='a', help='red', action=buffer.word_left, persistent=true },
  { key='b', help='orange', action=buffer.word_right, persistent=true },
})

local chameleon2_hydra = hydra.create({
  { key='c', help='green', action=buffer.word_left, persistent=true },
  { key='d', help='blue', action=buffer.word_right, persistent=true },
--  { key='s', help='change colours', action=function() ui.print(hydra.show_table(experiment_hydra)) end, persistent=true },
})

local experiment_hydra = hydra.create({
  { key='c', help='chameleon', action=chameleon1_hydra, persistent=true },
})

-- Every time a new buffer opens, the chameleon key in the experiment_hydra is mapped to the other "colour".
-- This demostrates how to modify hydra bindings on the fly.
events.connect(events.BUFFER_NEW, function(name)
  if not new_hydra then
    new_hydra = chameleon2_hydra
  end

  hydra.bind(experiment_hydra, { key='c', help='chameleon', action=new_hydra, persistent=true })

  if new_hydra == chameleon2_hydra then
    new_hydra = chameleon1_hydra
  else
    new_hydra = chameleon2_hydra
  end
end)

-- top-level hydras

local main_hydra = hydra.create({
  { key='f', help='file', action=file_hydra },
  { key='b', help='buffer', action=buffer_hydra },
  { key='v', help='view', action=view_hydra },
  { key='n', help='navigate by', action=navigation_hydra },
  { key='s', help='search', action=search_hydra },
  { key='e', help='edit', action=edit_hydra },
  { key='h', help='history', action=history_hydra },
  { key='t', help='tools', action=tool_hydra },
  { key='?', help='help', action=help_hydra },
  { key=' ', help='complete word', action=function() textadept.editing.autocomplete('word') end },
  { key='S', help='session', action=session_hydra },
  { key='x', help='experiments', action=experiment_hydra },
  { key="q", help="quit", action=quit },
})

hydra.keys = hydra.create({
  { key='ctrl+ ', help='main', action=main_hydra },
  { key='menu', help='main', action=main_hydra },
})

-- We don't need the menu bar; everything is available in a hydra
--if not OSX then events.connect(events.INITIALIZED, function() textadept.menu.menubar = nil end) end

--[[

Session handling.

I'm not using textadept's built-in session handling; I do my own thing.

--]]

-- Each directory can have its own session file.
session_filename = '.textadept_session'

local function file_exists(name)
   local f = io.open(name, "r")
   return f ~= nil and io.close(f)
end

-- When textadept finishes initialising, decide whether or not to load a session.
-- If the user didn't specify files to open on the command line, and there's a
-- session file in the current directory, then load the session.
events.connect(events.INITIALIZED, function()
--  print ('DEBUG #_BUFFERS',#_BUFFERS)
--  for n=0,#_BUFFERS,1 do
--    buffer=_BUFFERS[n]
--    print('DEBUG ',n,buffer.tab_label,buffer.filename)
--    for k,v in pairs(buffer) do
--      print("...",k,v,type(v))
--    end
--  end
  if (#_BUFFERS < 1) or (_BUFFERS[1].filename == nil) then
    -- There's only one open buffer (the default empty one), so we know that
    -- the user didn't specify files to open on the command line.
    if file_exists(session_filename) then
      -- print ('DEBUG loading session')
      textadept.session.load(session_filename)
    end
  end
end)

-- When textadept closes, save the session file in the current directory.
events.connect(events.QUIT, function()
  textadept.session.save(session_filename)
end, 1)

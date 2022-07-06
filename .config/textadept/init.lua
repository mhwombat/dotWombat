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
  { key="q", help="quit", action=quit }
}

local edit_hydra = {
  { key="u", help="undo", action=buffer.undo },
  { key="r", help="redo", action=buffer.redo },
  { key="del", help="cut", action=buffer.cut },
  { key="c", help="copy", action=buffer.copy },
  { key="p", help="paste", action=buffer.paste },
  { key="r", help="paste reindent", action=textadept.editing.paste_reindent },
  { key="2", help="duplicate", action=buffer.selection_duplicate },
  { key="x", help="delete", action=buffer.clear },
  { key="#", help="toggle block comment", action=textadept.editing.toggle_comment },
  { key="t", help="transpose characters", action=textadept.editing.transpose_chars },
  { key="j", help="join lines", action=textadept.editing.join_lines },
  { key='|', 
    help='pipe to bash', 
    action=function()
             ui.command_entry.run(textadept.editing.filter_through, 'bash')
           end },
  { key='C', help='enclose', action=case_hydra },
  { key='e', help='enclose', action=enclose_hydra },
  { key="up", help="move selected lines up", action=buffer.move_selected_lines_up },
  { key="down", help="move selected lines down", action=buffer.move_selected_lines_down }
}

local case_hydra = {
  { key="up", help="upper case selection", action=buffer.upper_case },
  { key="down", help="lower case selection", action=buffer.lower_case },
}

local enclose_hydra = {
  { key="?", help="enclose as xml tags", action=function()
        buffer:begin_undo_action()
        enc('<', '>')
        for i = 1, buffer.selections do
          local s, e = buffer.selection_n_start[i], buffer.selection_n_end[i]
          while buffer.char_at[s - 1] ~= 60 do s = s - 1 end -- '<'
          buffer:set_target_range(e, e)
          buffer:replace_target('</' .. buffer:text_range(s, e))
          buffer.selection_n_start[i], buffer.selection_n_end[i] = e, e
        end
        buffer:end_undo_action()
      end },
  { key="?", help="enclose as single xml tag", action=function() enc('<', ' />') end },
  { key="?", help="enclose in single quotes", action=function() enc("'", "'") end },
  { key="?", help="enclose in double quotes", action=function() enc('"', '"') end },
  { key="?", help="enclose in parentheses", action=function() enc('(', ')') end },
  { key="?", help="enclose in brackets", action=function() enc('[', ']') end },
  { key="?", help="enclose in braces", action=function() enc('{', ' }') end},
}

local select_hydra = {
  { key="*", help="all", action=buffer.select_all },
  { key='[', help='between delimiters', action=sel_enc },
  { key='<', help='between XML Tags', action=function() sel_enc('>', '<') end },
  { key=' ', help='in XML Tag', action=function() sel_enc('<', '>') end },
  { key='w', help='word', action=textadept.editing.select_word },
  { key='l', help='line', action=textadept.editing.select_line },
  { key='p', help='paragraph', action=textadept.editing.select_paragraph }
}

local word_hydra = {
  { key='left', help='prev', action=buffer.word_left, persistent=true },
  { key='right', help='next', action=buffer.word_right, persistent=true },
  { key='shift+left', help='shrink selection', action=buffer.word_left_extend, persistent=true },
  { key='shift+right', help='extend selection', action=buffer.word_right_extend, persistent=true },
}

local main_hydra = {
  { key='f', help='file', action=file_hydra },
  { key='w', help='word', action=word_hydra },
  { key='e', help='edit', action=edit_hydra },
  { key='s', help='select', action=select_hydra },
  { key=" ", help="complete word", action=function() textadept.editing.autocomplete('word') end },
  { key='?', help='debug hydra', action=hydra.print_keys },
}

hydra.keys = {
  { key='menu', action=main_hydra }
}


  --{ key="?", help="navigate backward", action=textadept.history.back },
  --{ key="?", help="navigate forward", action=textadept.history.forward },
  --{ key="?", help="record location", action=textadept.history.record },
  --{ key="?", help="clear history", action=textadept.history.clear }
  --{ key="?", help="preferences", action=function() io.open_file(_userhome .. '/init.lua') end }
  --{ key="?", help="find", action=ui.find.focus },
  --{ key="?", help="find next", action=ui.find.find_next },
  --{ key="?", help="find previous", action=ui.find.find_prev },
  --{ key="?", help="replace", action=ui.find.replace },
  --{ key="?", help="replace all", action=ui.find.replace_all },
  --{ key="?", help="find incremental", action=function() ui.find.focus{incremental = true } end},
  --{ key="?", help="find in files", action=function() ui.find.focus{in_files = true } end},
  --{ key="?", help="goto next file found", action=function() ui.find.goto_file_found(true) end },
  --{ key="?", help="goto previous file found", action=function() ui.find.goto_file_found(false) end },
  --{ key="?", help="jump to", action=textadept.editing.goto_line }
  --{ key="?", help="command entry", action=ui.command_entry.run },
  --{ key="?", help="select command", action=function() m.select_command() end },
  --{ key="?", help="run", action=textadept.run.run },
  --{ key="?", help="compile", action=textadept.run.compile },
  --{ key="?", help="set arguments...", action=textadept.run.set_arguments },
  --{ key="?", help="build", action=textadept.run.build },
  --{ key="?", help="run tests", action=textadept.run.test },
  --{ key="?", help="stop", action=textadept.run.stop },
  --{ key="?", help="next error", action=function() textadept.run.goto_error(true) end },
  --{ key="?", help="previous error", action=function() textadept.run.goto_error(false) end },
  --{ key="?", help="toggle bookmark", action=textadept.bookmarks.toggle },
  --{ key="?", help="clear bookmarks", action=textadept.bookmarks.clear },
  --{ key="?", help="next bookmark", action=function() textadept.bookmarks.goto_mark(true) end },
  --{ key="?", help="previous bookmark", action=function() textadept.bookmarks.goto_mark(false) end },
  --{ key="?", help="goto bookmark...", action=textadept.bookmarks.goto_mark },
  --{ key="?", help="start/stop recording", action=textadept.macros.record },
  --{ key="?", help="play", action=textadept.macros.play },
  --{ key="?", help="save...", action=textadept.macros.save },
  --{ key="?", help="load...", action=textadept.macros.load },
  --{ key="?", help="quickly open user home", action=function() io.quick_open(_userhome) end },
  --{ key="?", help="quickly open textadept home", action=function() io.quick_open(_home) end },
  --{ key="?", help="quickly open current directory", action=function()
  --{ key="?", help="quickly open current project", action=io.quick_open },
  --{ key="?", help="insert snippet...", action=textadept.snippets.select },
  --{ key="?", help="expand snippet/next placeholder", action=textadept.snippets.insert },
  --{ key="?", help="previous snippet placeholder", action=textadept.snippets.previous },
  --{ key="?", help="cancel snippet", action=textadept.snippets.cancel_current },
  --{ key="?", help="complete trigger word", action=function() textadept.editing.autocomplete('snippets') end }
  --{ key="?", help="complete symbol", action=function() textadept.editing.autocomplete(buffer:get_lexer(true)) end },
  --{ key="?", help="show documentation", action=textadept.editing.show_documentation },
  --{ key="?", help="show style", action=function()
  --{ key="?", help="next buffer", action=function() view:goto_buffer(1) end },
  --{ key="?", help="previous buffer", action=function() view:goto_buffer(-1) end },
  --{ key="?", help="switch to buffer...", action=ui.switch_buffer },
  --{ key="?", help="tab width: 2", action=function() set_indentation(2) end },
  --{ key="?", help="tab width: 3", action=function() set_indentation(3) end },
  --{ key="?", help="tab width: 4", action=function() set_indentation(4) end },
  --{ key="?", help="tab width: 8", action=function() set_indentation(8) end },
  --{ key="?", help="toggle use tabs", action=function()
  --{ key="?", help="convert indentation", action=textadept.editing.convert_indentation }
  --{ key="?", help="crlf", action=function() set_eol_mode(buffer.eol_crlf) end },
  --{ key="?", help="lf", action=function() set_eol_mode(buffer.eol_lf) end }
  --{ key="?", help="utf-8 encoding", action=function() set_encoding('utf-8') end },
  --{ key="?", help="ascii encoding", action=function() set_encoding('ascii') end },
  --{ key="?", help="cp-1252 encoding", action=function() set_encoding('cp1252') end },
  --{ key="?", help="utf-16 encoding", action=function() set_encoding('utf-16le') end }
  --{ key="?", help="toggle wrap mode", action=function()
  --{ key="?", help="toggle view whitespace", action=function()
  --{ key="?", help="select lexer...", action=textadept.file_types.select_lexer }
  --{ key="?", help="next view", action=function() ui.goto_view(1) end },
  --{ key="?", help="previous view", action=function() ui.goto_view(-1) end },
  --{ key="?", help="split view horizontal", action=function() view:split() end },
  --{ key="?", help="split view vertical", action=function() view:split(true) end },
  --{ key="?", help="unsplit view", action=function() view:unsplit() end },
  --{ key="?", help="unsplit all views", action=function() while view:unsplit() do end end },
  --{ key="?", help="grow view", action=function()
  --{ key="?", help="shrink view", action=function()
  --{ key="?", help="toggle current fold", action=function()
  --{ key="?", help="toggle show indent guides", action=function()
  --{ key="?", help="toggle virtual space", action=function()
  --{ key="?", help="zoom in", action=view.zoom_in },
  --{ key="?", help="zoom out", action=view.zoom_out },
  --{ key="?", help="reset zoom", action=function() view.zoom = 0 end }
  --{ key="?", help="show manual", action=function() open_page(_home .. '/docs/manual.html') end },
  --{ key="?", help="show luadoc", action=function() open_page(_home .. '/docs/api.html') end },
  --{ key="?", help="about", action=function()
  --{ key="?", help="undo", action=buffer.undo },
  --{ key="?", help="redo", action=buffer.redo },
  --{ key="?", help="cut", action=buffer.cut },
  --{ key="?", help="copy", action=buffer.copy },
  --{ key="?", help="paste", action=buffer.paste },
  --{ key="?", help="delete", action=buffer.clear },
  --{ key="?", help="select all", action=buffer.select_all }
  --{ key="?", help="close", action=buffer.close },
  --{ key="?", help="save", action=buffer.save },
  --{ key="?", help="save as", action=buffer.save_as },
  --{ key="?", help="reload", action=buffer.reload },

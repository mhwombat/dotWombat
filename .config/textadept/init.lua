--require('textredux').hijack()

local lsp = require('lsp')

-- require "theme"
view:set_theme(not CURSES and 'base16-amy' or 'term')

--ui.statusbar_text = "Hello, wombat!\nThis is line 2"
--
--hydra.wombat("The function works")
--
--keys['menu'] = hydra.wombat("Hi wombat!")
--keys['ctrl+w'] = hydra.wombat("Hello there, wombat!")

--
-- Hydra key bindings
--
local hydra = require('hydra')

--local file_hydra = {
--  { key='n', help="new", action=buffer.new },
--  { key='o', help="open", action=io.open_file },
--  { key='r', help="open recent", action=io.open_recent_file },
--  { key='s', help="save", action=buffer.save },
--  { key='S', help="save as", action=buffer.save_as },
--  { key='c', help="close", action=buffer.close },
--  { key='R', help="reload", action=buffer.reload },
--}

local word_hydra = {
  { key='left', help="prev", action=buffer.word_left, persistent=true },
  { key='right', help="next", action=buffer.word_right, persistent=true },
  { key='shift+left', help="shrink selection", action=buffer.word_left_extend, persistent=true },
  { key='shift+right', help="extend selection", action=buffer.word_right_extend, persistent=true },
}

local line_hydra = {
  { key='j', help="join", action=textadept.editing.join_lines },
  { key='|', 
    help="pipe to bash", 
    action=function()
             ui.command_entry.run(textadept.editing.filter_through, 'bash')
           end },
}

hydra.keys = {
  { key='ctrl+w', help="word", action=word_hydra },
  { key='ctrl+l', help="line", action=line_hydra }
}

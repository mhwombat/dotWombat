local lsp = require('lsp')

-- require "theme"
view:set_theme(not CURSES and 'base16-amy' or 'term')

--keys['<menu>'] = {
--  ['f'] = {
--    ['n'] = buffer.new,
--    ['o'] = io.open_file,
--    ['s'] = buffer.save,
--    ['q'] = quit
--  }
--}

-- Add menu option for resetting Textadept's Lua state.
--local tools = textadept.menu.menubar[_L['Tools']]
local tools = textadept.menu.context_menu
--table.insert(tools, {''}) -- menu separator
table.insert(tools, {'Reset L_ua State', reset})


-- init.lua from vimlife_with_hammerspoon
require('./modules/change_input_source_if_ko'):bind_change_input_source_with({}, "escape")
require('./modules/vim_keymap'):bind_vim_keymap_with({"cmd", "shift"}, "space")

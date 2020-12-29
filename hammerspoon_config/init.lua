
-- init.lua from vimlife_with_hammerspoon
require('./modules/change_input_source_if_ko'):bind_change_input_source_with({}, "escape")

-- You can turn on/off 'vim_mode' by shortcuts.
-- Default shortcuts are {"cmd, shift"}, "space".
-- You can customize modifier and key. 
-- If you want to use {"cmd"} + "v" as shortcuts, set as below.
-- require('./modules/vim_keymap'):bind_vim_keymap_with({"cmd"}, "v")
-- ---------------------------------------------------------------------
-- Check key code of hammerspoon as below
-- | f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13, f14, f15,
-- | f16, f17, f18, f19, f20, pad, pad*, pad+, pad/, pad-, pad=,
-- | pad0, pad1, pad2, pad3, pad4, pad5, pad6, pad7, pad8, pad9,
-- | padclear, padenter, return, tab, space, delete, escape, help,
-- | home, pageup, forwarddelete, end, pagedown, left, right, down, up,
-- | shift, rightshift, cmd, rightcmd, alt, rightalt, ctrl, rightctrl,
-- | capslock, fn
-- ---------------------------------------------------------------------

require('./modules/vim_keymap'):bind_vim_keymap_with({"cmd", "shift"}, "space")

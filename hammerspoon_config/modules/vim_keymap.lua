local vim_keymap_obj = {}

-- vim mode draft 

local mod = {
	empty = {},
	shift = {"shift"},
	alt = {"alt"},
	cmd = {"cmd"},
	ctrl = {"ctrl"},
	cmd_and_shift = {"cmd", "shift"},
}

local vim_mode = true

local fastKeyStroke = function(modifier, event_char)
	hs.eventtap.keyStroke(modifier, event_char, 30)
end

local h_bind = hs.hotkey.new({}, "h", 
	function() fastKeyStroke(mod.empty, "left") end, 
	nil, 
	function() fastKeyStroke(mod.empty, "left") end):enable()
local j_bind = hs.hotkey.new({}, "j", 
	function() fastKeyStroke(mod.empty, "down") end, 
	nil, 
	function() fastKeyStroke(mod.empty, "down") end):enable()
local k_bind = hs.hotkey.new({}, "k", 
	function() fastKeyStroke(mod.empty, "up") end, 
	nil, 
	function() fastKeyStroke(mod.empty, "up") end):enable()
local l_bind = hs.hotkey.new({}, "l", 
	function() fastKeyStroke(mod.empty, "right") end, 
	nil, 
	function() fastKeyStroke(mod.empty, "right") end):enable()
	
local x_bind = hs.hotkey.new({}, "x", 
	function() fastKeyStroke(mod.empty, "forwarddelete") end, 
	nil, 
	function() fastKeyStroke(mod.empty, "forwarddelete") end):enable()
local w_bind = hs.hotkey.new({}, "w", 
	function() fastKeyStroke(mod.alt, "right") end, 
	nil, 
	function() fastKeyStroke(mod.alt, "right") end):enable()
local b_bind = hs.hotkey.new({}, "b", 
	function() fastKeyStroke(mod.alt, "left") end, 
	nil, 
	function() fastKeyStroke(mod.alt, "left") end):enable()
local i_bind = hs.hotkey.new({}, "i", 
	function()
		hs.eventtap.keyStroke(mod.cmd_and_shift, "space", 30)
	end):enable()
local a_bind = hs.hotkey.new({}, "a", 
	function()
		fastKeyStroke(mod.empty, "right")
		hs.eventtap.keyStroke(mod.cmd_and_shift, "space", 30)
	end):enable()
local o_bind = hs.hotkey.new({}, "o", 
	function()
		fastKeyStroke(mod.cmd, "right")
		fastKeyStroke(mod.empty, "return")
		hs.eventtap.keyStroke(mod.cmd_and_shift, "space", 30)
	end):enable()
local p_bind = hs.hotkey.new({}, "p", 
	function()
		fastKeyStroke(mod.cmd, "v")
	end):enable()
local u_bind = hs.hotkey.new({}, "u", 
	function()
		fastKeyStroke(mod.cmd, "z")
	end):enable()
local shift_d_bind = hs.hotkey.new({"shift"}, "d", 
	function()
		fastKeyStroke(mod.cmd_and_shift, "right")
		fastKeyStroke(mod.empty, "forwarddelete")
	end):enable()
local shift_a_bind = hs.hotkey.new({"shift"}, "a", 
	function()
		fastKeyStroke(mod.cmd, "right")
		hs.eventtap.keyStroke(mod.cmd_and_shift, "space", 30)
	end):enable()
local shift_o_bind = hs.hotkey.new({"shift"}, "o", 
	function()
		fastKeyStroke(mod.cmd, "left")
		fastKeyStroke(mod.empty, "return")
		fastKeyStroke(mod.empty, "up")
		hs.eventtap.keyStroke(mod.cmd_and_shift, "space", 30)
	end):enable()

-- bind 'y' + 'w' and 'd' + 'b'
local y_modal = hs.hotkey.modal.new()

y_modal:bind({}, "y", function() 
	fastKeyStroke(mod.cmd, "left")
	fastKeyStroke(mod.cmd_and_shift, "right") 
	fastKeyStroke(mod.cmd, "c") 
	y_modal:exit()
end)

local y_with_other_bind = hs.hotkey.new({}, "y",
	function() 
		y_modal:enter() 
	end
):enable()

-- bind 'd' + 'w' and 'd' + 'b'
local d_modal = hs.hotkey.modal.new()

d_modal:bind({}, "w", function() 
	fastKeyStroke(mod.alt, "forwarddelete") 
	d_modal:exit()
end)
d_modal:bind({}, "b", function() 
	fastKeyStroke(mod.alt, "delete") 
	d_modal:exit()
end)
d_modal:bind({}, "d", function() 
	fastKeyStroke(mod.cmd, "left") 
	fastKeyStroke(mod.cmd_and_shift, "right") 
	fastKeyStroke(mod.cmd, "x") 
	d_modal:exit()
end)

local d_with_other_bind = hs.hotkey.new({}, "d", 
	function() 
		d_modal:enter() 
	end
):enable()

function set_vim_keymap()
	h_bind:enable()
	j_bind:enable()
	k_bind:enable()
	l_bind:enable()
	x_bind:enable()
	o_bind:enable()
	w_bind:enable()
	b_bind:enable()
	i_bind:enable()
	a_bind:enable()
	p_bind:enable()
	u_bind:enable()
	shift_d_bind:enable()
	shift_a_bind:enable()
	shift_o_bind:enable()
	y_with_other_bind:enable()
	d_with_other_bind:enable()
	hs.alert.show("set vim keymap")
end

function unset_vim_keymap()
	h_bind:disable()
	j_bind:disable()
	k_bind:disable()
	l_bind:disable()
	x_bind:disable()
	o_bind:disable()
	w_bind:disable()
	b_bind:disable()
	i_bind:disable()
	a_bind:disable()
	p_bind:disable()
	u_bind:disable()
	shift_d_bind:disable()
	shift_a_bind:disable()
	shift_o_bind:disable()
	y_with_other_bind:disable()
	d_with_other_bind:disable()
	hs.alert.show("unset vim keymap")
end

local vim_mode_menubar = hs.menubar.new()
function vim_keymap_obj:set_vim_mode()
	if vim_mode == true then
		unset_vim_keymap()
		vim_mode_menubar:setTitle("𝑽_OFF")
		vim_mode = false
    else
		set_vim_keymap()
		vim_mode_menubar:setTitle("𝑽_ON")
		vim_mode = true
	end
end

function vim_keymap_obj:make_menubar_clickable()
    if vim_mode_menubar then
        vim_mode_menubar:setClickCallback(vim_keymap_obj.set_vim_mode)
        vim_mode_menubar:setTitle("𝑽_ON")
    end
end

function vim_keymap_obj:bind_vim_keymap_with(modifier, key)
    hs.hotkey.bind(modifier, key, vim_keymap_obj.set_vim_mode)
    vim_keymap_obj.make_menubar_clickable()
end

return vim_keymap_obj

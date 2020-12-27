local obj = {}

local mod = {
	empty = {},
	shift = {"shift"},
	alt = {"alt"},
	cmd = {"cmd"},
	ctrl = {"ctrl"},
	cmd_and_shift = {"cmd", "shift"},
}

local inputEnglish = "com.apple.keylayout.ABC"
local esc_bind

function obj:change_input_source_if_ko()
	local inputSource = hs.keycodes.currentSourceID()
	if not (inputSource == inputEnglish) then
		hs.eventtap.keyStroke(mod.empty, 'right')
		hs.keycodes.currentSourceID(inputEnglish)
	end
    esc_bind:disable()
    hs.eventtap.keyStroke(mod.empty, 'escape')
	esc_bind:enable()
end

function obj:bind_change_input_source_with(modifier, key)
    print(modifier)
    print(key)
    esc_bind = hs.hotkey.new(modifier, key, obj.change_input_source_if_ko)
    esc_bind:enable()
end

return obj
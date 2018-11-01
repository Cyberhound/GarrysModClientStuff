--[[
  NOTE: This can be used as an example gui. I used some direct things I shouldn't for console logging and such,
  should probably be removed and not used. It can cause crashes/problems. The rest is suprisingly stable.
  
  If your interested, DM me.
]]--

local font = WinLua.CreateFont()

local main_menu = WinLua.CreateMenu()

local main_ui = WinLua.RegisterForm('Coballs', 'Cobalt v4', 644, 367, 500, 500, main_menu, Flags.WS_EX_TOPMOST, Flags.WS_SYSMENU, Flags.WS_MAXIMIZE, Flags.WS_MINIMIZEBOX, Flags.WS_EX_PALETTEWINDOW)
--yes, i actually named it coballs. everyone took cobalt v4 and brutialized it and started saying cobait and cowballs, cawballs, and coballs.
--i was like skrew it and so i just put coballs. P.S. coballs = key for UI, this has to be different for all uis or they'll intercept
--its sent through RegisterClassExA

local coballs_v4 = WinLua.CreateMenu(main_ui)
WinLua.AppendMenu(main_menu, coballs_v4, 'Cobalt v4')
local corolls = WinLua.AppendMenu(main_menu, 'Unload Cobalt')
local coballs_quit = WinLua.AppendMenu(coballs_v4, 'Quit')
local coballs_credits = WinLua.AppendMenu(coballs_v4, 'Credits')

local execute_button = WinLua.CreateWindow(Controls.Button, 'Execute', 111, 23, 4, 291, main_ui, Flags.WS_VISIBLE, Flags.WS_CHILD, Flags.BS_FLAT)
local open_button = WinLua.CreateWindow(Controls.Button, 'Open', 111, 23, 121, 291, main_ui, Flags.WS_VISIBLE, Flags.WS_CHILD, Flags.BS_FLAT)
local save_button = WinLua.CreateWindow(Controls.Button, 'Save', 111, 23, 238, 291, main_ui, Flags.WS_VISIBLE, Flags.WS_CHILD, Flags.BS_FLAT)
local clear_button = WinLua.CreateWindow(Controls.Button, 'Clear', 92, 23, 355, 291, main_ui, Flags.WS_VISIBLE, Flags.WS_CHILD, Flags.BS_FLAT)

local script_box = WinLua.CreateWindow(Controls.TextBox, '', 630, 282, 4, 3, main_ui, Flags.WS_VISIBLE, Flags.WS_CHILD, Flags.WS_BORDER, Flags.WS_VSCROLL, Flags.WS_HSCROLL, Flags.ES_AUTOVSCROLL, Flags.ES_MULTILINE)
local cmd_box = WinLua.CreateWindow(Controls.TextBox, '', 180, 20, 453, 293, main_ui, Flags.WS_VISIBLE, Flags.WS_CHILD)

local console_ui = WinLua.RegisterForm('Corolls', 'Cobalt v4 | Console', 500, 300, 100, 100, WinLua.CreateMenu(), Flags.WS_EX_TOPMOST, Flags.WS_SYSMENU, Flags.WS_MAXIMIZE, Flags.WS_MINIMIZEBOX, Flags.WS_EX_PALETTEWINDOW)
local console_box = WinLua.CreateWindow(Controls.TextBox, '', 486, 263, 4, 4, console_ui, Flags.WS_VISIBLE, Flags.WS_CHILD, Flags.WS_BORDER, Flags.WS_VSCROLL, Flags.WS_HSCROLL, Flags.ES_AUTOVSCROLL, Flags.ES_MULTILINE, Flags.ES_READONLY)

WinLua.SetFont(execute_button, font)
WinLua.SetFont(open_button, font)
WinLua.SetFont(save_button, font)
WinLua.SetFont(clear_button, font)
WinLua.SetFont(script_box, font)
WinLua.SetFont(console_box, font)
WinLua.SetFont(cmd_box, font)

--[[ Functionality Here ]]--

WinLua.HookEvent(execute_button, function()
	execute_cscript(WinLua.GetText(script_box))
end)

WinLua.HookEvent(open_button, function()
	open_dialog(script_box)
end)

WinLua.HookEvent(save_button, function()
	save_dialog(script_box)
end)

WinLua.HookEvent(clear_button, function()
	WinLua.SetText(script_box, '')
end)

WinLua.HookEvent(coballs_quit, function()
	exit(0)
end)

WinLua.HookEvent(coballs_credits, function()
	MessageBox.Show(Buttons.Ok, 'Credits:\nCyberhound#5672 - Developing and updating this exploit\nOoMoltres#6585 - Helping me use my brain\nBlushy#4465 - Helping develop UI\'s and themes', 'Credits')
end)

hook_cmd_box(cmd_box)

WinLua.HookEvent(cmd_box, function()
	local res = get_cmd_box_ret(cmd_box)
	local txt = WinLua.GetText(cmd_box)
	
	if res ~= "no data" then
		WinLua.print(console_box, txt .. "\n")
		
		if res ~= "success" then
			WinLua.print(RGB(125, 125, 125), console_box, res .. "\n")
		end
		
		reset_cmd_box_ret(cmd_box)
		
		WinLua.SetText(cmd_box, '')
	end
end)

WinLua.HookEvent(corolls, function()
	unload_cobalt()
end)

--[[ Functionality Ends ]]--
ShowWindow(main_ui, true)
ShowWindow(console_ui, true)

redirect_printf(console_box) --this should not be here. this is a dangerous line that reference a function that is dangerous. but it works.

WinLua.CreateMessageLoop(main_ui)

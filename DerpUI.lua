-- I didn't create this UI, I coded everything here though. This UI is special, its retarded.
local font = WinLua.CreateFont()

local main_menu = WinLua.CreateMenu()

local main_ui = WinLua.RegisterForm('Eylsian Cobalt', 'Elysian', 644, 367, 500, 500, main_menu, Flags.WS_EX_TOPMOST, Flags.WS_SYSMENU, Flags.WS_MAXIMIZE, Flags.WS_MINIMIZEBOX, Flags.WS_EX_PALETTEWINDOW)

local script_box = WinLua.CreateWindow(Controls.TextBox, '', 560, 200, 10, 10, main_ui, Flags.WS_CHILD, Flags.WS_VISIBLE, Flags.WS_HSCROLL, Flags.WS_VSCROLL, Flags.ES_MULTILINE, Flags.WS_BORDER)
local console_box = WinLua.CreateWindow(Controls.TextBox, '', 638, 88, 160, 220, main_ui, Flags.WS_CHILD, Flags.WS_VISIBLE, Flags.WS_HSCROLL, Flags.WS_VSCROLL, Flags.ES_MULTILINE, Flags.WS_BORDER, Flags.ES_READONLY)

local execute_button = WinLua.CreateWindow(Controls.Button, 'Execute', 140, 20, 10, 220, main_ui, Flags.WS_CHILD, Flags.WS_VISIBLE)
local list_box = WinLua.CreateWindow(Controls.ListBox, '', 160, 298, 570, 10, main_ui, Flags.WS_VISIBLE, Flags.WS_CHILD)

WinLua.SetFont(execute_button, font)
WinLua.SetFont(script_box, font)
WinLua.SetFont(console_box, font)

--[[ Functionality Here ]]--

WinLua.HookEvent(execute_button, function()
	execute_cscript(WinLua.GetText(script_box))
end)

--[[ Functionality Ends ]]--
ShowWindow(main_ui, true)
ShowWindow(console_ui, true)

redirect_printf(console_box) -- again, scary.

WinLua.CreateMessageLoop(main_ui)

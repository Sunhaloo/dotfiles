-- All my launchers, programs and such ( to be used by `keybinds.lua` file )

return {
	-- Launcher
	launcher = " panel-toggle launcher",
	session_launcher = " panel-toggle launcher /session",
	control_panel = " panel-toggle control-center",

	-- Main programs
	browser = "thorium-browser",
	file_manager = "thunar",
	notes = "obsidian",
	terminal = "kitty",

	-- Utility Programs
	colour_picker = "hyprpicker | wl-copy",

	-- Misc Launcher
	clipboard = " panel-toggle clipboard",
	clipboard_clear = " clipboard-clear",
	emojis = " panel-toggle launcher /emo",
	noctalia_bar = " bar-toggle",
	noctalia_settings = " settings-open",
	notifications_panel = " panel-toggle control-center notifications",
	notifications_panel_clear = " notification-clear-history",
	wallpaper = " panel-toggle wallpaper",
	screenshot_full = " screenshot-fullscreen",
	screenshot_region = " screenshot-region",

	-- Security and Privacy
	lockscreen = " session lock",
}

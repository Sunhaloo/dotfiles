-- Docs: https://wiki.hypr.land/Configuring/Basics/Window-Rules/

hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- Notes
hl.window_rule({
	name = "notes-windowrule",
	-- Application: Obsidian
	match = { class = "obsidian" },
	workspace = "1",
})

-- Terminal
hl.window_rule({
	name = "terminal-windowrule",
	-- Application: Kitty
	match = { class = "kitty" },
	workspace = "2",
})

-- Browser
-- hl.window_rule({
-- 	name = "browser-windowrule",
-- 	-- Application: Zen Browser
-- 	match = { class = "zen" },
-- 	workspace = "3",
-- })

-- Browser
hl.window_rule({
	name = "browser-windowrule",
	-- Application: Thorium Browser
	match = { class = "Thorium-browser" },
	workspace = "3",
})

-- File Manager
hl.window_rule({
	name = "filemanager-windowrule",
	-- Application: Thunar
	match = { class = "thunar" },
	workspace = "4",
})

-- Internet Messenger
hl.window_rule({
	name = "messaging-windowrule",
	-- Application: Discord
	match = { class = "discord" },
	workspace = "9",
})

-- Recording
hl.window_rule({
	name = "recording-windowrule",
	-- Application: OBS Studio
	match = { class = "com.obsproject.Studio" },
	workspace = "10",
})

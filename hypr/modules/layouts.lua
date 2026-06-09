-- Docs:
  -- https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/
  -- https://wiki.hypr.land/Configuring/Layouts/Master-Layout/
  -- https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/

-- Set the current layout to use
hl.config({
  general = {
    layout = "dwindle",
  }
})

-- Dwindle Layout Configuration
hl.config({
    dwindle = {
	preserve_split = true,
	force_split = 2,
    },
})

-- Master Layout Configuration
-- NOTE: Might remove this later as I don't really like it!
hl.config({
    master = {
        new_status = "master",
    },
})

-- Scrolling Layout Configuration
hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
	column_width = 1.0,
	-- WARNING: Still need to configure the following below
	-- Need to configure the keybinding to be the same as Niri
	explicit_column_widths = "0.33333, 0.5, 0.66667",
    },
})



-- Docs:
-- https://wiki.hypr.land/Configuring/Basics/Monitors/
-- https://wiki.hypr.land/Configuring/Basics/Variables/#input
-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Gestures/
-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/

-- Monitor: Generic
hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "auto",
})

-- Monitor: MSI Katana 15 B13V
-- hl.monitor({
--     output   = "",
--     mode     = "1920x1080@144",
--     position = "auto",
--     scale    = 1,
-- })

-- Input Devices
hl.config({
	input = {
		-- Keyboard
		kb_layout = "us",
		repeat_rate = 20,
		repeat_delay = 200,

		-- Mouse
		sensitivity = 0,
		follow_mouse = 1,
		accel_profile = "flat",

		-- Well, shitty touchpads
		touchpad = {
			scroll_factor = 0.2,
			natural_scroll = true,
		},
	},
})

-- Touchpad Gestures
hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

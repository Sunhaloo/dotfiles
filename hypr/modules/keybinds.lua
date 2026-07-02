-- Docs: https://wiki.hypr.land/Configuring/Basics/Binds/

-- Source the `programs.lua` file to use our variables
local programs = require("modules.programs")

-- Noctalia inter-process commmunication call
local ipc = "qs -c noctalia-shell ipc call"

-- Screenshot Directory
local screenshot_dir = os.getenv("HOME") .. "/Screenshots"

-- Main Modifiers
local mod = "SUPER"
local alt = "ALT"

-- General Keybinds
hl.bind(
	mod .. " + SHIFT + E",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind(mod .. " + Q", hl.dsp.window.close())

-- Hardware: Volume Controls ( Hyprland's Default )
-- hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 2%+"), { locked = true, repeating = true })
-- hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"),      { locked = true, repeating = true })
-- hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
-- hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })

-- Hardware: Volume Controls ( Noctalia's IPC )
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(ipc .. " volume increase"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(ipc .. " volume decrease"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(ipc .. " volume muteOutput"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(ipc .. " volume muteInput"), { locked = true, repeating = true })

-- Hardware: Brightness Controls ( Hyprland's Default - Requires `brightnessctl` )
-- hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 1%+"),                  { locked = true, repeating = true })
-- hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 1%-"),                  { locked = true, repeating = true })

-- Hardware: Brightness Controls ( Noctalia's IPC )
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(ipc .. " brightness increase"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(ipc .. " brightness decrease"), { locked = true, repeating = true })

-- Hardware: Audio Controls ( Hyprland's Default -- Requires `playerctl` )
-- hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
-- hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
-- hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
-- hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- Hardware: Audio Controls ( Noctalia's IPC )
hl.bind("XF86AudioNext", hl.dsp.exec_cmd(ipc .. " media next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd(ipc .. " media playPause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(ipc .. " media play"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd(ipc .. " media previous"), { locked = true })

-- Hardware: Mouse
hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Workspaces [0 - 9]
for i = 1, 10 do
	local key = i % 10

	-- Switch to specific workspace ( number )
	hl.bind(mod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	-- Move window to specific workspace ( number )
	hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Windows: Focus Windows
hl.bind(mod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + L", hl.dsp.focus({ direction = "right" }))

-- Windows: Move Windows
hl.bind(mod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(mod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))

-- Windows: Window Layouts
hl.bind(mod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + S", hl.dsp.layout("swapsplit"))
hl.bind(alt .. " + SHIFT + S", hl.dsp.layout("togglesplit")) -- NOTE: 'dwindle' layout only!
hl.bind(alt .. " + SHIFT + P", hl.dsp.window.pseudo())

-- Applications: Launchers
hl.bind(mod .. " + SPACE", hl.dsp.exec_cmd(ipc .. programs.launcher))

-- INFO: Now that we are able to do everything ( poweroff, etc ) from the program launcher... Do we really need these below?
-- hl.bind(alt .. " + SPACE", hl.dsp.exec_cmd(programs.command_launcher)) -- try to use session launcher instead
-- hl.bind(alt .. " + SPACE", hl.dsp.exec_cmd(ipc .. programs.session_launcher))

-- Applications: Programs
hl.bind(mod .. " + RETURN", hl.dsp.exec_cmd(programs.terminal))
hl.bind(mod .. " + SHIFT + B", hl.dsp.exec_cmd(programs.browser))
hl.bind(mod .. " + SHIFT + T", hl.dsp.exec_cmd(programs.file_manager))
hl.bind(mod .. " + SHIFT + O", hl.dsp.exec_cmd(programs.notes))

-- Applications: Misc
hl.bind(mod .. " + PERIOD", hl.dsp.exec_cmd(ipc .. programs.emojis))
hl.bind(mod .. " + W", hl.dsp.exec_cmd(ipc .. programs.noctalia_bar))
hl.bind(mod .. " + COMMA", hl.dsp.exec_cmd(ipc .. programs.noctalia_settings))
hl.bind(mod .. " + SHIFT + N", hl.dsp.exec_cmd(ipc .. programs.notifications_panel))

hl.bind(alt .. " + SHIFT + V", hl.dsp.exec_cmd(ipc .. programs.clipboard))
hl.bind(alt .. " + SHIFT + C", hl.dsp.exec_cmd(programs.clipboard_clear))
hl.bind(alt .. " + SHIFT + W", hl.dsp.exec_cmd(ipc .. programs.wallpaper))
hl.bind(alt .. " + SHIFT + N", hl.dsp.exec_cmd(ipc .. programs.notifications_panel_clear))

-- Screenshots: Fullscreen + Region
hl.bind(
	"PRINT",
	hl.dsp.exec_cmd(
		[[grim - | tee "]]
			.. screenshot_dir
			.. [[/$(date +%Y%m%d_%H%M%S).png" | wl-copy && ]]
			.. ipc
			.. [[ toast send '{"title":"Screenshot","body":"Fullscreen screenshot copied and saved"}']]
	)
)

hl.bind(
	mod .. " + SHIFT + S",
	hl.dsp.exec_cmd(
		[[grim -g "$(slurp -w 0 -b 00000088)" - | tee "]]
			.. screenshot_dir
			.. [[/$(date +%Y%m%d_%H%M%S).png" | wl-copy && ]]
			.. ipc
			.. [[ toast send '{"title":"Screenshot","body":"Selection copied and saved"}']]
	)
)

-- Security and Privacy
hl.bind(alt .. " + SHIFT + L", hl.dsp.exec_cmd(ipc .. programs.lockscreen))

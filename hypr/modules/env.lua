-- Docs: https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

-- Toolkit Backend
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")

-- XDG environment variables
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- NOTE: Qt and Nvidia has not been set yet!

-- Cursors
hl.env("XCURSOR_SIZE", "16")
hl.env("HYPRCURSOR_SIZE", "16")

-- Noctalia Related
hl.env("QT_QPA_PLATFORMTHEME", "gtk3")

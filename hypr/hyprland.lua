-- source other files
require("modules.env")
require("modules.startup")
require("modules.keybinds")
require("modules.device")
require("modules.layouts")
require("modules.windowrules")
require("modules.workspacerules")
require("modules.layerrules")
require("modules.appearance")
require("modules.misc")

------------------
---- MONITORS ----
------------------

---------------------
---- MY PROGRAMS ----
---------------------

-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })

----------------
----  MISC  ----
----------------

---------------
---- INPUT ----
---------------

---------------------
---- KEYBINDINGS ----
---------------------

-- local closeWindowBind = hl.bind(mainMod .. " + C", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)

-- Example special workspace (scratchpad)
-- hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
-- hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- Docs: https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- NOTE: just test it out and see how it feels like
-- This is going to make workspace 2 ( only ) to have a scrolling behaviour
hl.workspace_rule({
  workspace = "2",
  layout = "scrolling"
})

-- Workspace 7
hl.workspace_rule({
  workspace = "7",
  gaps_out = 25,
})

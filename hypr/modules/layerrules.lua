-- Docs: https://wiki.hypr.land/Configuring/Basics/Window-Rules/#layer-rules

-- Noctalia Shell: Blur
hl.layer_rule({
    name         = "noctalia",
    match        = { namespace = "noctalia-background-.*$" },
    ignore_alpha = 0.5,
    blur         = true,
    blur_popups  = true,
})

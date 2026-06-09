-- Docs: https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.on("hyprland.start", function ()
  -- 'hyprpolkitagent' ==> GUI authentication
  hl.exec_cmd("systemctl --user start hyprpolkitagent")
  -- Noctalia Shell
  hl.exec_cmd("qs -c noctalia-shell")
end)

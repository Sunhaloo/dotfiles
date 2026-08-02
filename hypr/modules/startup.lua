-- Docs: https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.on("hyprland.start", function()
	-- 'hyprpolkitagent' ==> GUI authentication
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
	-- Noctalia Shell
	hl.exec_cmd("qs -c noctalia-shell")
	-- Git Pull Script
	hl.exec_cmd("$HOME/.config/hypr/scripts/git-pull.sh")
end)

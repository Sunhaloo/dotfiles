# AGENTS.md

This file provides guidance to agents when working with code in this repository.

## Project Type
Personal dotfiles repository for Linux (Hyprland Wayland environment). No build/test/lint commands - this is a collection of configuration files.

## Neovim
- Uses LazyVim as base with custom plugins in [`nvim/lua/plugins/`](nvim/lua/plugins/)
- Custom snippets loaded from [`nvim/lua/snippets/*.lua`](nvim/lua/snippets/) (not standard LuaSnip locations)
- Leader key is `<Space>` (set in both [`nvim/lua/config/options.lua`](nvim/lua/config/options.lua:1) and [`nvim/lua/config/lazy.lua`](nvim/lua/config/lazy.lua:17))
- Lua formatting: 2-space indent, 120 column width (see [`nvim/stylua.toml`](nvim/stylua.toml))
- Colorcolumn at 80 enforced by [`virt-column`](nvim/lua/plugins/ui.lua:26) plugin

## Tmux
- Prefix key is `C-s` (not default `C-b`) - see [`tmux/tmux.conf`](tmux/tmux.conf:39)
- Startup script accessible via `t` alias in zsh - see [`zsh/.zshrc`](zsh/.zshrc:55) and [`tmux/scripts/tmux_startup.sh`](tmux/scripts/tmux_startup.sh)

## Hyprland
- Config split into multiple sourced files: env.conf, startup.conf, keybinds.conf, layouts.conf, workspaces.conf, devices.conf, options.conf, appearance.conf
- Pyprland scratchpads configured in [`hypr/pyprland.toml`](hypr/pyprland.toml) (term, yazi, networkmanager)

## Kanata
- Force quit: `LCtrl + Space + Esc`
- Custom layers: navigation_numbers, symbols, mouse - see [`kanata/config.kbd`](kanata/config.kbd)

## Waybar
- Config uses JSONC with includes from `modules/` subdirectories - see [`waybar/config.jsonc`](waybar/config.jsonc)

## Kitty
- Remote control enabled on unix socket `/tmp/kitty` - see [`kitty/kitty.conf`](kitty/kitty.conf:38)

## Starship
- Uses custom 'deepspace' palette defined in [`starship/starship.toml`](starship/starship.toml:106)

## Zsh
- Uses `zoxide` for cd replacement - see [`zsh/.zshrc`](zsh/.zshrc:43)
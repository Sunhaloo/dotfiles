return {
	-- combination of some great plugins made by the man himself... Folke
	"folke/snacks.nvim",
	priority = 1000,
	-- plugin IS loaded in immediately during startup
	lazy = false,
	-- start on these 2 events
	event = { "BufReadPre", "BufNewFile" },

	-- actual configuration for 'snacks'
	opts = {
		-- configure the styles for the pickers
		styles = {
			-- set up the floating layout
			float = {
				-- make the borders look more modern
				border = "rounded",
			},
		},

		-- disabled "mini" / individual plugins
		animate = { enabled = false },
		bigfile = { enabled = false },
		dashboard = { enabled = false },

		-- enabled "mini" / individual plugins
		-- ability to view images inside of Neovim
		image = { enabled = true },

		-- basicially indent-guides for tabbings
		indent = {
			enabled = true,
			-- disable animations for indentation
			animate = { enabled = false },
			-- configure when / how the indentation is going to show up
			indent = {
				-- show all the indentation guide on position of caret
				only_scope = false,
				-- change the colours of the each indentation
				-- hl = {
				-- 	"SnacksIndent1",
				-- 	"SnacksIndent2",
				-- 	"SnacksIndent3",
				-- 	"SnacksIndent4",
				-- 	"SnacksIndent5",
				-- 	"SnacksIndent6",
				-- 	"SnacksIndent7",
				-- 	"SnacksIndent8",
				-- },
			},
			chunk = {
				-- when enabled, scopes will be rendered as chunks, except for the
				-- top-level scope which will be rendered as a scope.
				enabled = true,
				-- only show chunk scopes in the current window
				only_current = false,
				priority = 200,
				hl = "SnacksIndentChunk", ---@type string|string[] hl group for chunk scopes
				char = {
					corner_top = "╭",
					corner_bottom = "╰",
					horizontal = "",
					vertical = "│",
					arrow = "",
				},
			},
		},

		-- basically a telescope replacement
		picker = {
			enabled = true,
			-- what is shown where next to the caret
			-- how the "searching algorithm" works
			matcher = {
				-- WARNING: bonuses options has performance impact

				-- give me priority to files accessed in chronological order
				history_bonus = true,
			},
		},

		-- basically better nvim-notify
		notifier = {
			enabled = true,
			-- change the style of the notification popup
			style = "fancy",
		},

		-- renders file as quickly as possible before loading plugins
		quickfile = { enabled = true },

		-- beautify the status column
		statuscolumn = {
			enabled = true,
		},

		-- snacks own terminal "emulator"
		terminal = {
			enabled = true,
			-- setup terminal to become float
			win = { style = "terminal" },
		},
	},

	-- key mappings configuration for each individual plugins
	keys = {
		-- == Picker Related ==

		-- open file explorer
		{
			"<leader>e",
			function()
				Snacks.picker.explorer({
					-- change the layout to "vertical"
					layout = "vertical",
				})
			end,
			desc = "Find All Files [ Snacks ]",
		},

		-- buffer picker
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers({
					-- change the layout to "select"
					layout = "select",
					-- start in 'NORMAL' mode instead of 'INSERT' mode
					on_show = function()
						vim.cmd.stopinsert()
					end,
				})
			end,
			desc = "Find Buffers [ Snacks ]",
		},

		-- search and select file ( smartly?!? )
		{
			"<leader>fa",
			function()
				Snacks.picker.smart()
			end,
			desc = "Find ( Smart ) Files [ Snacks ]",
		},

		-- search and select file just like in telescope
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "Find Files [ Snacks ]",
		},

		-- find all recently used files
		{
			"<leader>fo",
			function()
				Snacks.picker.recent({
					-- change the layout to "select"
					layout = "select",
				})
			end,
			desc = "Find Old Files [ Snacks ]",
		},

		-- live grep ==> search for specific word in file
		{
			"<leader>fl",
			function()
				Snacks.picker.grep({
					-- change the layout to "telescope"
					layout = "telescope",
				})
			end,
			desc = "Live Grep [ Snacks ]",
		},

		-- search and select configuration files present in the `~/.config` directory
		{
			"<leader>fC",
			function()
				Snacks.picker.files({
					-- search for files only on the `~/.config` directory
					cwd = vim.fn.expand("$HOME/.config/"),
					-- change the layout to "telescope"
					layout = "telescope",
				})
			end,
			desc = "Find Config Files [ Snacks ]",
		},

		-- find all the "callouts" comment in a code / markdown document
		{
			"<leader>ft",
			function()
				Snacks.picker.todo_comments({
					-- change the layout to "telescope"
					layout = "telescope",
				})
			end,
			desc = "Highlighted Comments [ Snacks ]",
		},

		-- search and select obsidian files present in the vault
		{
			"<leader>fO",
			function()
				Snacks.picker.files({
					-- search for files only on the `~/Obsidian/S.Sunhaloo/` directory
					cwd = vim.fn.expand("$HOME/Obsidian/S.Sunhaloo/"),
					-- change the layout to "sidebar"
					layout = "sidebar",
					on_show = function()
						vim.cmd.stopinsert()
					end,
				})
			end,
			desc = "Find Obsidian Files [ Snacks ]",
		},

		-- << Git Stuffs >>

		-- well, what can I say... 'lazygit' inside of neovim!
		{
			"<leader>lg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit [ Snacks ]",
		},

		--
		{
			"<leader>fg",
			function()
				Snacks.picker.git_files({
					-- change the layout to "telescope"
					layout = "telescope",
				})
			end,
			desc = "Find Git Files [ Snacks ]",
		},

		-- basically open the local repository ( at main ) on the web browser ( if remote repos is present )
		{
			"<leader>gO",
			function()
				Snacks.gitbrowse()
			end,
			desc = "Git Browse - Open Browser [ Snacks ]",
		},

		-- basically open the local repository ( at that specific file ) on the web browser ( if remote repos is present )
		{
			"<leader>gF",
			function()
				Snacks.gitbrowse.open()
			end,
			desc = "Git Browse - File [ Snacks ]",
		},

		-- == Terminal ==

		{
			-- NOTE: it actually '<Control> + /'
			"<c-_>",
			function()
				Snacks.terminal.toggle()
			end,
			desc = "Toggle Floating Terminal [ Snacks ]",
		},

		-- == Coding ==

		-- == LSP Related Stuff ==
		{
			"<leader>gd",
			function()
				Snacks.picker.lsp_definitions()
			end,
			desc = "LSP Definitions [ Snacks ]",
		},

		{
			"<leader>gD",
			function()
				Snacks.picker.lsp_declaration()
			end,
			desc = "LSP Declarations",
		},

		{
			"<leader>gR",
			function()
				Snacks.picker.lsp_references()
			end,
			desc = "LSP References",
		},

		{
			"<leader>gi",
			function()
				Snacks.picker.lsp_type_definitions()
			end,
			desc = "LSP Type Definitions",
		},

		{
			"<leader>d",
			function()
				Snacks.picker.diagnostics({
					-- change the layout to "telescope"
					layout = "telescope",
				})
			end,
			desc = "LSP Diagnostics",
		},
		{
			"<leader>D",
			function()
				Snacks.picker.diagnostics_buffer()
			end,
			desc = "LSP Buffer Diagnostics",
		},

		-- find help documentation related to neovim and installed plugins
		{
			"<leader>fh",
			function()
				Snacks.picker.help({
					-- change the layout to "sidebar"
					layout = "sidebar",
				})
			end,
			desc = "Help Pages [ Snacks ]",
		},

		-- general 'man page' finder but also in neovim
		{
			"<leader>fm",
			function()
				Snacks.picker.man({
					-- change the layout to "sidebar"
					layout = "sidebar",
				})
			end,
			desc = "Linux Man Pages [ Snacks ]",
		},

		-- undo history
		{
			"<leader>uh",
			function()
				Snacks.picker.undo({
					-- change the layout to "sidebar"
					layout = "vertical",
				})
			end,
			desc = "Undo History [ Snacks ]",
		},

		-- == Miscellaneous ==

		-- selection of colourscheme
		{
			"<leader>th",
			function()
				Snacks.picker.colorschemes()
			end,
		},

		-- IDK when I am going to need this... Buts its here!
		{
			"<leader>I",
			function()
				Snacks.picker.icons()
			end,
			desc = "Icons [ Snacks ]",
		},

		-- again, IDK when I am going to needs this... Butt ))!
		{
			"<leader>hl",
			function()
				Snacks.picker.highlights({
					-- change the layout to "vertical"
					layout = "vertical",
				})
			end,
			desc = "Icons [ Snacks ]",
		},

		-- hide the annoying fucking, repetitive notifications
		{
			"<leader>un",
			function()
				Snacks.notifier.hide()
			end,
			desc = "Dismiss Notifications [ Snacks ]",
		},

		-- find and select projects
		{
			"<leader>fp",
			function()
				Snacks.picker.projects({
					-- change the layout to "select"
					layout = "select",
				})
			end,
			desc = "Projects [ Snacks ]",
		},
	},

	-- toggle-able neovim options --> copied from documentation
	init = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				_G.dd = function(...)
					Snacks.debug.inspect(...)
				end
				_G.bt = function()
					Snacks.debug.backtrace()
				end
				vim.print = _G.dd

				-- keymappings for toggle-able options
				Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>ol")
			end,
		})
	end,
}

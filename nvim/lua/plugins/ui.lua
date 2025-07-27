return {
	-- {
	-- 	-- plugin that adds better and visually appealing UI
	-- 	"folke/noice.nvim",
	-- 	-- start on the event ( 'VeryLazy' ==> Start after essentials plugins and UI have already started )
	-- 	event = "VeryLazy",
	-- 	dependencies = { "MunifTanjim/nui.nvim" },
	-- 	-- configuration for 'noice.nvim'
	-- 	config = function()
	-- 		-- enable the plugin
	-- 		require("noice").setup({})
	-- 	end,
	-- },
	{
		-- plugin that highlights 'TODO' comments, etc
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		-- start on these 2 events
		event = { "BufReadPre", "BufNewFile" },
		-- configuration for 'todo-comments'
		config = function()
			local todo_comments = require("todo-comments")
			-- create a variable ( similar to keymaps.lua file )
			local keymap = vim.keymap -- for conciseness

			-- jump to next todo-comment
			keymap.set("n", "]t", function()
				todo_comments.jump_next()
			end, { desc = "Next todo comment" })
			-- jump to previous todo-comment
			keymap.set("n", "[t", function()
				todo_comments.jump_prev()
			end, { desc = "Previous todo comment" })
			-- call the setup function
			todo_comments.setup()
		end,
	},
	{
		-- plugin that customises the command line area / bottom bar
		"nvim-lualine/lualine.nvim",
		dependencies = { "echasnovski/mini.icons" },
		-- start on the event ( 'VeryLazy' ==> Start after essentials plugins and UI have already started )
		event = "VeryLazy",
		-- configuration for 'lualine'
		config = function()
			require("lualine").setup({
				options = {
					section_separators = "",
					component_separators = "",
				},
				-- active window --> sections settings
				sections = {
					lualine_a = { "mode" },
					lualine_b = {
						-- git branches
						{ "branch" },
						-- git diffs
						{
							"diff",
							-- add custom symbols to 'diff' changes
							symbols = {
								added = "+ ",
								modified = " ",
								removed = " ",
							},
						},
						-- LSP diagnostics
						{ "diagnostics" },
					},
					lualine_c = {
						-- filename... Duhh!
						{
							"filename",
							-- add custom symbols to 'filename' based on ( see below )
							symbols = {
								modified = "",
								readonly = "",
								unnamed = "",
								newfile = "",
							},
						},
					},
					-- lualine_x = {'encoding', 'fileformat', 'filetype'},
					lualine_x = {
						-- encoding options
						{
							"encoding",
							show_bomb = true,
						},
						-- format of the file that is being worked on
						{ "fileformat" },
						-- well type of the file ==> 'filetype'
						{
							"filetype",
							-- WARNING: currently now working as I am using 'mini.icons' ==> still needs configuration
							icon_only = true,
						},
					},
					-- lualine_y = {"location"},
					-- trying it out without the 'location'
					lualine_y = {},
					lualine_z = {
						-- date
						{
							"datetime",
							-- supports `strftime` options from Python's 'datetime.datetime' module
							style = "%d/%m/%Y",
						},
					},
				},
				-- inactive window --> sections settings
				inactive_sections = {
					lualine_a = { bruh },
					lualine_b = {},
					-- same as the "active" one
					lualine_c = {
						{
							"filename",
							-- add custom symbols to 'filename' based on ( see below )
							symbols = {
								modified = "",
								readonly = "",
								unnamed = "",
								newfile = "",
							},
						},
					},
					lualine_x = {},
					lualine_y = {},
					lualine_z = {},
				},
			})
		end,
	},
	{
		-- plugin for "tab" / buffer ( customisation )
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = { "echasnovski/mini.icons" },
		-- start on the event ( 'VeryLazy' ==> Start after essentials plugins and UI have already started )
		event = "VeryLazy",
		-- need to add the keymaps ( as bufferline overrides it )
		keys = {
			-- refer to `keymaps.lua` file
			{ "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next Tab / Buffer [ bufferline ]" },
			{ "<Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Next Tab / Buffer [ bufferline ]" },
		},
		-- configuration for 'bufferline'
		config = function()
			require("bufferline").setup({
				-- general options and appearance configuration
				options = {
					-- << General Options >>
					-- make "bufferline" to act on tabs over buffers
					mode = "tabs",
					-- << Mouse Options >>
					-- right click will make current buffer split horizontally
					right_mouse_command = "horizontal sbuffer %d",
					-- middle mouse button will make current buffer split vertically
					middle_mouse_command = "vertical sbuffer %d",
					-- << Appearance Options >>
					-- indicate if you are on "current" buffer / tab
					indicator = {
						-- icon = " ",
						-- change `style` to `'icon'` and uncomment line above to use icon
						style = "underline",
					},
					-- << Icons >>
					-- icons to show if file has been modified / changed
					modified_icon = "",
					-- color the icons
					color_icons = true,
					-- << Separator Style >>
					-- options for the `separator_style`
					-- "slant" | "slope" | "thick" | "thin" | { 'any', 'any' }
					separator_style = "thin",
				},
			})
		end,
	},
	{
		-- plugin will be used to show what keymaps we have configured
		-- The Human Brain is NOT Good!
		"folke/which-key.nvim",
		-- start on the event ( 'VeryLazy' ==> Start after essentials plugins and UI have already started )
		event = "VeryLazy",
		-- configuration for 'which-key'
		opts = {
			-- change the style / theme
			preset = "helix",
		},
		-- how to "open" / "call" 'which-key'
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show()
				end,
				desc = "Current Buffer Local Keymappings [ which-key ]",
			},
		},
	},
	{
		-- plugin that "highlights" the 80th column
		"lukas-reineke/virt-column.nvim",
		-- start on the event ( 'VeryLazy' ==> Start after essentials plugins and UI have already started )
		event = "VeryLazy",
		-- configuration for 'virt-column'
		config = function()
			require("virt-column").setup({
				-- change the default "pipe" character
				char = "|",
				-- similar to `vim.opt.colorcolumn`
				virtcolumn = "80",
			})
		end,
	},
}

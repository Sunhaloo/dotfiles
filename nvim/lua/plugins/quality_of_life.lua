return {
	{
		-- quality of life plugin that will save my ass if the power go down
		"okuuva/auto-save.nvim",
		-- version = '^1.0.0', -- see https://devhints.io/semver, alternatively use '*' to use the latest tagged release
		-- use the latest version
		version = "*",
		-- lazy loading on command
		cmd = "ASToggle",
		-- start when Leaving in Insert Mode
		event = "InsertLeave",
		-- configuration for 'auto-save.nvim'
		opts = {
			-- auto-start 'auto-save.nvim' when package manager load plugins
			enabled = true,
			-- how long to wait to save ( based on the `events` )
			debounce_delay = 3000,
			noautocmd = true,
		},
	},
	{
		-- allows vim motions between Neovim windows
		"christoomey/vim-tmux-navigator",
		-- start on these 2 events
		-- event = { "BufReadPre", "BufNewFile" },
		event = "InsertEnter",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
			"TmuxNavigatorProcessList",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},

	{
		-- installed this because snacks need it
		"folke/edgy.nvim",
		-- start on these 2 events
		event = { "BufReadPre", "BufNewFile" },
		opts = function(_, opts)
			for _, pos in ipairs({ "top", "bottom", "left", "right" }) do
				opts[pos] = opts[pos] or {}
				table.insert(opts[pos], {
					ft = "snacks_terminal",
					size = { height = 0.4 },
					title = "%{b:snacks_terminal.id}: %{b:term_title}",
					filter = function(_buf, win)
						return vim.w[win].snacks_win
							and vim.w[win].snacks_win.position == pos
							and vim.w[win].snacks_win.relative == "editor"
							and not vim.w[win].trouble_preview
					end,
				})
			end
		end,
	},
}

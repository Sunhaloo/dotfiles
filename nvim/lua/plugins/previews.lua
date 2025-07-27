return {
	{
		-- ulra, mega, chad plugin for general previewing
		"sylvanfranklin/omni-preview.nvim",
		-- start on these 2 events
		event = { "BufReadPre", "BufNewFile" },
		-- dependencies to install with 'omni-preview'
		dependencies = {
			{
				-- markdown previewer
				"toppair/peek.nvim",
				-- plugin is NOT loaded in immediately during startup
				lazy = true,
				-- on what filetype to act
				ft = "markdown",
				-- make sure that you have 'deno' installed on your system
				build = "deno task --quiet build:fast",
			},
		},
		-- configuration for 'omni-preview'
		config = function()
			require("omni-preview").setup()

			-- configuration for 'peek' markdown previewer
			require("peek").setup({
				-- change default preview from 'webview' to 'browser'
				app = "browser",
			})
		end,

		-- customise the keymappings ( omni-preview )
		keys = {
			{ "<leader>Op", "<Cmd>OmniPreview start<CR>", desc = "Start Omni Preview" },
			{ "<leader>op", "<Cmd>OmniPreview stop<CR>", desc = "Stop Omni Preview" },
		},
	},
}

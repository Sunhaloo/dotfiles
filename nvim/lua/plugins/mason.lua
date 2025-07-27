return {
	-- package manager for LSP, Linters, Formatters
	"mason-org/mason.nvim",
	-- dependencies to install with 'mason'
	dependencies = {
		-- acts like a bridge between 'nvim-lspconfig' and 'mason' itself
		"mason-org/mason-lspconfig.nvim",
		-- will allow us to download formatters automatically
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},

	-- configuration for 'mason' and 'mason-lspconfig'
	config = function()
		-- define our "variables" / import our configuration files
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		-- configuration for 'mason'
		mason.setup({
			-- ui configuration for mason
			ui = {
				-- do `:h nvim_open_win()` for options
				border = "rounded",
				-- configure the icons
				icons = {
					package_installed = " ",
					package_pending = " ",
					package_uninstalled = " ",
				},
			},
		})

		-- configuration for 'mason-lspconfig'
		mason_lspconfig.setup({
			-- automatically install missing tools from `ensure_installed` on startup
			automatic_enable = false,
			-- make sure that these LSPs are installed "by default"
			ensure_installed = {
				"lua_ls",
				"pyright",
				"marksman",
			},
		})

		-- -- configuration for 'mason-tool-installer'
		mason_tool_installer.setup({
			-- make sure that these formatters are installed "by default"
			ensure_installed = {
				"luacheck",
				"stylua",
				"black",
				"isort",
				"ruff",
				"prettier",
				"markdown-toc",
			},
			-- auto update them because I always forget about it
			auto_update = true,
			-- run on start and check whether to install / update
			run_on_start = true,
			-- change the timings to attempt to install / update
			debounce_hours = 10,
		})
	end,
}

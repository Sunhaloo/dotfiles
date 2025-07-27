return {
	"stevearc/conform.nvim",
	-- start on these 2 events
	event = { "BufReadPre", "BufNewFile" },

	-- actual conform / formatting configuration
	config = function()
		require("conform").setup({
			-- format based on file types
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black", "isort" },
				markdown = { "prettier", "markdown-toc" },
			},

			-- allow formatting on save
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		})
	end,
}

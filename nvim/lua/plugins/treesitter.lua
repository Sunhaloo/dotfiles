return {
	-- better syntax highlighting
	"nvim-treesitter/nvim-treesitter",
	-- run the command `:TSUpdate` whenever we are updating plugins with 'lazy'
	build = ":TSUpdate",
	-- start on these 2 events
	event = { "BufReadPre", "BufNewFile" },
	-- configuration for 'nvim-treesitter'
	config = function()
		-- import the configuration files for 'nvim-treesitter'
		require("nvim-treesitter.configs").setup({
			-- make sure that parsers for these languages are installed by "default"
			ensure_installed = {
				"c",
				"bash",
				"lua",
				"python",
				"markdown",
				"markdown_inline",
				"yaml",
				"json",
				"html",
				"sql",
			},
			-- enable highlighting
			highlight = {
				enable = true,
				-- disable highlights / 'nivm-treesitter' based on file types
				disable = {},
			},
			-- enable indentation ( view documentation for more information )
			indent = {
				enable = true,
			},
			-- what parsers do we need to ignore
			ignore_install = {},
			-- no need to install parsers automatically ( write down what you need manually )
			auto_install = false,
			-- don't install parsers synchronously
			sync_install = false,
		})
	end,
}

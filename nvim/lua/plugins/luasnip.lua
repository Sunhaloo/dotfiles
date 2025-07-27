return {
	-- snippets engine
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	-- optional to install 'jsregexp' ( make sure that you have 'luarocks' on your system )
	build = "make install_jsregexp",
	-- start on the event ( 'VeryLazy' ==> Start after essentials plugins and UI have already started )
	-- event = "VeryLazy",
	event = "InsertEnter",
	-- dependencies to install with 'LuaSnip'
	dependencies = {
		-- provide VS C*de's Snippets without any configuration
		{
			"rafamadriz/friendly-snippets",
			-- event = "VeryLazy",
			event = "InsertEnter",
		},
	},
	-- configuration for LuaSnip
	config = function()
		-- importing the 'LuaSnip' file
		local ls = require("luasnip")
		-- importing and enabling the 'friendly-snippets.nvim' plugin
		require("luasnip.loaders.from_vscode").lazy_load()

		-- create a function that will be able to load snippets from directory
		local function load_snippets()
			-- find the snippets directory / folder
			local snippets_location = vim.fn.glob(vim.fn.stdpath("config") .. "/lua/snippets/*.lua", 1, 1)
			-- start searching through this directory
			for _, file in ipairs(snippets_location) do
				-- find the language
				local language = file:match("([^/]+)%.lua$")
				-- find the file where that "trigger" / snippet is located
				local snippets = dofile(file)
				-- provide us with the snippet ( like "full code" )
				ls.add_snippets(language, snippets)
			end
		end

		-- call the function to that we can use this "custom" directory
		load_snippets()
	end,
}

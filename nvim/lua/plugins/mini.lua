return {
	{
		-- choosing 'mini.pairs' and testing it ( over 'nvim-autopairs' )
		"echasnovski/mini.pairs",
		version = false,
		-- start on when in Insert Mode
		event = "InsertEnter",

		-- configuration for 'mini.pairs'
		config = function()
			-- enable the autopairs plugin
			require("mini.pairs").setup({
				mappings = {
					-- create autopairs for '<>' as mini.pairs does not come with that
					["<"] = { action = "open", pair = "<>", neigh_pattern = "[^\\]." },
					[">"] = { action = "close", pair = "<>", neigh_pattern = "[^\\]." },
				},
			})
		end,
	},
	{
		-- basically a better ( in my opinion ) colorizer plugin
		"echasnovski/mini.hipatterns",
		version = false,
		-- start on the event ( 'VeryLazy' ==> Start after essentials plugins and UI have already started )
		event = "VeryLazy",
		-- configuration for 'mini.hipatterns'
		config = function()
			-- import the configuration file
			local mini_hipatterns = require("mini.hipatterns")
			-- setup 'mini.hipatterns'
			mini_hipatterns.setup({
				highlighters = {
					-- enable highlights for 'todo-comments.nvim' plugin
					bug = { pattern = "%f[%w]()BUG:()%f[%W]", group = "MiniHipatternsFixme" },
					warning = { pattern = "%f[%w]()WARNING:()%f[%W]", group = "MiniHipatternsHack" },
					todo = { pattern = "%f[%w]()TODO:()%f[%W]", group = "MiniHipatternsTodo" },
					note = { pattern = "%f[%w]()NOTE:()%f[%W]", group = "MiniHipatternsNote" },
					info = { pattern = "%f[%w]()INFO:()%f[%W]", group = "MiniHipatternsNote" },
					tip = { pattern = "%f[%w()TIP:()%f[%W]", group = "MiniHipatternsTodo" },

					-- enable the highlights for hex color codes ( as per documentation )
					hex_color = mini_hipatterns.gen_highlighter.hex_color(),
				},
			})
		end,
	},
}

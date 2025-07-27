return {
	-- better auto-completion for Neovim
	"Saghen/blink.cmp",
	-- start on when in Insert Mode
	event = "InsertEnter",
	-- use a release tag to download pre-built binaries ==> default option
	version = "*",

	-- actual configuration for blink

	opts = {
		-- general blink settings
		menu = {
			auto_show = true,
		},

		-- priority for sourcing auto-completion
		sources = {
			-- basically show auto-completion in this priority
			default = { "lsp", "snippets", "buffer", "path" },
		},

		-- custom snippets
		snippets = { preset = "luasnip" },

		-- keymap configuration
		keymap = {
			-- make it similar to VS C*de
			preset = "super-tab",
		},

		-- how blink will internal fuzzy finder will work
		fuzzy = { implementation = "prefer_rust" },

		-- some appearance changes
		completion = {
			menu = {
				border = "rounded",
			},

			documentation = {
				window = {
					border = "rounded",
				},
			},
		},
	},
}

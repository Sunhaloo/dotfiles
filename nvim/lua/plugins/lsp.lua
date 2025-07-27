return {
	-- quickstart configurations for LSP
	"neovim/nvim-lspconfig",
	-- start on these 2 events
	event = { "BufReadPre", "BufNewFile" },
	-- event = "InsertEnter",
	-- dependencies to install with 'nvim-lspconfig'
	dependencies = {
		{
			-- properly configure lua-language-server for neovim configuration
			"folke/lazydev.nvim",
			-- load only on lua 'filetypes'
			ft = "lua",
			opts = {
				library = {
					-- See the configuration section for more details
					-- Load luvit types when the `vim.uv` word is found
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
	},

	-- actual LSP configuration
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			-- create group ( organise and manage LSP auto-commands only )
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			-- create callback function ( 'event' as arg )
			callback = function(ev)
				-- variable that will truncate `vim.keymap`
				local key = vim.keymap
				-- variable what will hold these options for LOCAL Buffer ONLY
				local opts = { buffer = ev.buf, silent = true }

				-- keymaps for LSP
				opts.desc = "Next Diagnostics"
				key.set("n", "]d", vim.diagnostic.goto_next, opts)

				opts.desc = "Previous Diagnostics"
				key.set("n", "[d", vim.diagnostic.goto_prev, opts)

				opts.desc = "Show Documentation Under Cursor"
				key.set("n", "K", vim.lsp.buf.hover, opts)

				opts.desc = "Restart LSP"
				key.set("n", "<leader>rs", "<Cmd>LspRestart<CR>", opts)
			end,
		})

		-- define the icons for the severity of each diagnostics
		local signs = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.HINT] = "󰠠 ",
			[vim.diagnostic.severity.INFO] = " ",
		}

		-- actually configure 'vim.diagnostics' ( refer to `:help 'vim.diagnostics.config()' )
		vim.diagnostic.config({
			signs = {
				text = signs,
			},
			virtual_text = true,
			underline = true,
			update_in_insert = false,
		})

		-- import configuration files
		local lspconfig = require("lspconfig")
		local completion = require("blink.cmp")
		local capabilities = completion.get_lsp_capabilities()

		-- configure the individual servers
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					completion = {
						callSnippet = "Replace",
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})

		lspconfig.pyright.setup({
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				-- create a local variable for options
				local opts = { noremap = true, silent = true, buffer = bufnr }
				-- create local variable for setting keymaps
				local key = vim.keymap
				key.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
			end,
		})

		lspconfig.marksman.setup({
			capabilities = capabilities,
		})
	end,
}

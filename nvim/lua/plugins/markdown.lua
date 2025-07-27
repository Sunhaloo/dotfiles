return {
	-- INFO: using without ( for the moment ) as I am using 'omni-preview'
	-- {
	--     -- better visual and UI for markdown files
	--     "MeanderingProgrammer/render-markdown.nvim",
	--     -- start on these 2 events
	--     event = { "BufReadPre", "BufNewFile" },
	--     dependencies = {
	--         "nvim-treesitter/nvim-treesitter",
	--         "echasnovski/mini.icons"
	--     },
	-- },
	{
		-- plugin that that will provide us with "auto-bullets"
		"bullets-vim/bullets.vim",
		-- start on when in Insert Mode
		-- event = "InsertEnter",
		-- on what file types of act
		ft = "markdown",
		-- configuration for 'bullets.vim'
		config = function()
			vim.g.bullets_delete_last_bullet_if_empty = 1
		end,
	},
	{
		-- basically "Obsidian" in Neovim
		"epwalsh/obsidian.nvim",
		version = "*",
		-- plugin is NOT loaded in immediately during startup
		lazy = true,
		-- on what filetype to act
		ft = "markdown",
		dependencies = { "nvim-lua/plenary.nvim" },
		-- configuration for 'obsidian.nvim'
		opts = {
			-- configure the vaults
			workspaces = {
				{
					-- main workspace / vault
					name = "Main Vault ( S.Sunhaloo )",
					path = "~/Obsidian/S.Sunhaloo/",
				},
				{
					-- secondary workspace / vault
					name = "QnA Vault",
					path = "~/Obsidian/Question - Problems - Solutions/",
				},
			},
			-- configure the path to obsidian's templates
			templates = {
				folder = "~/Obsidian/S.Sunhaloo/Obsidian Management/Templates/",
			},
			-- don't allow 'obsidian.nvim' to handle the YAML frontmatter
			disable_frontmatter = true,
			-- setup the attachments folders
			attachments = {
				-- setup the image folders
				img_folder = "~/Obsidian/S.Sunhaloo/Obsidian Management/Media/Images/",
			},
		},
	},
}

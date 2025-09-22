return {
  "sylvanfranklin/omni-preview.nvim",
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
    {
      "barrett-ruth/live-server.nvim",
      build = "pnpm add -g live-server",
      cmd = { "LiveServerStart", "LiveServerStop" },
      config = true,
    },
    -- { "chomosuke/typst-preview.nvim", lazy = true },
    { "wallpants/github-preview.nvim", lazy = true },
  },

  -- configuration for 'omni-preview'
  config = function()
    require("omni-preview").setup()

    -- configuration for 'peek' markdown previewer
    require("peek").setup({
      -- change default preview from 'webview' to 'browser'
      app = "browser",
    })

    require("github-preview").setup({})
  end,

  -- customise the keymappings ( omni-preview )
  keys = {
    { "<leader>Op", "<cmd>OmniPreview start<cr>", desc = "Start Omni Preview" },
    { "<leader>op", "<cmd>OmniPreview stop<cr>", desc = "Stop Omni Preview" },
  },
}

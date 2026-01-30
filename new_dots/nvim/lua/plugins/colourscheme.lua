return {
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("cyberdream").setup({
        transparent = true,
      })
    end,
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
  },
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    config = function()
      require("onedark").setup({
        style = "dark",
      })
      -- Enable theme
      -- require("onedark").load()
    end,
  },
}

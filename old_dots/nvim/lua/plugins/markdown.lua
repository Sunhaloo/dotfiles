return {
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
}

return {
  "folke/snacks.nvim",

  opts = {
    styles = {
      float = {
        border = "rounded",
      },
    },

    animate = { enabled = false },
    dashboard = { enabled = false },

    image = { enabled = true },

    indent = {
      enabled = true,
      indent = {
        only_scope = false,
      },
      chunk = {
        enabled = true,
        only_current = false,
        priority = 200,
        hl = "SnacksIndentChunk",
        char = {
          corner_top = "╭",
          corner_bottom = "╰",
          horizontal = "",
          vertical = "│",
          arrow = "",
        },
      },
    },

    picker = {
      enabled = true,
      matcher = {
        history_bonus = true,
      },
    },
  },
  keys = {
    {
      "<leader>fc",
      false,
    },
    {
      "<leader>,",
      false,
    },
    {
      "<leader>fo",
      function()
        Snacks.picker.recent({
          -- change the layout to "select"
          layout = "telescope",
        })
      end,
      desc = "Find Old Files [ Snacks ]",
    },
    {
      "<leader>fg",
      function()
        Snacks.picker.git_files({
          -- change the layout to "telescope"
          layout = "telescope",
        })
      end,
      desc = "Find Git Files [ Snacks ]",
    },
    {
      "<leader>fl",
      function()
        Snacks.picker.grep({
          -- change the layout to "telescope"
          layout = "telescope",
        })
      end,
      desc = "Live Grep [ Snacks ]",
    },
    {
      "<leader>fC",
      function()
        Snacks.picker.files({
          -- search for files only on the `~/.config` directory
          cwd = vim.fn.expand("$HOME/.config/"),
          -- change the layout to "telescope"
          layout = "telescope",
        })
      end,
      desc = "Find Config Files [ Snacks ]",
    },
    {
      "<leader>gO",
      function()
        Snacks.gitbrowse()
      end,
      desc = "Git Browse - Open Browser [ Snacks ]",
    },
  },
}

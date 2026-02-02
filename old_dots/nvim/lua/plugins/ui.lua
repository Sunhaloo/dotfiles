return {
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Tab / Buffer [ bufferline ]" },
      { "<Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Next Tab / Buffer [ bufferline ]" },
    },
    config = function()
      require("bufferline").setup({
        options = {
          mode = "tabs",
          right_mouse_command = "horizontal sbuffer %d",
          middle_mouse_command = "vertical sbuffer %d",
          indicator = {
            style = "underline",
          },
          modified_icon = "",
          color_icons = true,
          separator_style = "slope",
        },
      })
    end,
  },
  {
    -- plugin that "highlights" the 80th column
    "lukas-reineke/virt-column.nvim",
    -- start on the event ( 'VeryLazy' ==> Start after essentials plugins and UI have already started )
    event = "VeryLazy",
    -- configuration for 'virt-column'
    config = function()
      require("virt-column").setup({
        -- change the default "pipe" character
        char = "|",
        -- similar to `vim.opt.colorcolumn`
        virtcolumn = "80",
      })
    end,
  },
  {
    -- plugin that customises the command line area / bottom bar
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-mini/mini.icons" },
    -- start on the event ( 'VeryLazy' ==> Start after essentials plugins and UI have already started )
    event = "VeryLazy",
    -- configuration for 'lualine'
    config = function()
      require("lualine").setup({
        options = {
          section_separators = "",
          component_separators = "",
        },
        -- active window --> sections settings
        sections = {
          lualine_a = { "mode" },
          lualine_b = {
            -- git branches
            { "branch" },
            -- git diffs
            {
              "diff",
              -- add custom symbols to 'diff' changes
              symbols = {
                added = "+ ",
                modified = " ",
                removed = " ",
              },
            },
            -- LSP diagnostics
            { "diagnostics" },
          },
          lualine_c = {
            -- filename... Duhh!
            {
              "filename",
              -- add custom symbols to 'filename' based on ( see below )
              symbols = {
                modified = "",
                readonly = "",
                unnamed = "",
                newfile = "",
              },
            },
          },
          -- lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_x = {
            -- encoding options
            {
              "encoding",
              show_bomb = true,
            },
            -- format of the file that is being worked on
            { "fileformat" },
            -- well type of the file ==> 'filetype'
            {
              "filetype",
              -- WARNING: currently now working as I am using 'mini.icons' ==> still needs configuration
              icon_only = true,
            },
          },
          -- lualine_y = {"location"},
          -- trying it out without the 'location'
          lualine_y = {},
          lualine_z = {
            -- date
            {
              "datetime",
              -- supports `strftime` options from Python's 'datetime.datetime' module
              style = "%d/%m/%Y",
            },
          },
        },
        -- inactive window --> sections settings
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          -- same as the "active" one
          lualine_c = {
            {
              "filename",
              -- add custom symbols to 'filename' based on ( see below )
              symbols = {
                modified = "",
                readonly = "",
                unnamed = "",
                newfile = "",
              },
            },
          },
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
      })
    end,
  },
  {
    -- plugin that "highlights" the 80th column
    "lukas-reineke/virt-column.nvim",
    -- start on the event ( 'VeryLazy' ==> Start after essentials plugins and UI have already started )
    event = "VeryLazy",
    -- configuration for 'virt-column'
    config = function()
      require("virt-column").setup({
        -- change the default "pipe" character
        char = "|",
        -- similar to `vim.opt.colorcolumn`
        virtcolumn = "80",
      })
    end,
  },
  -- basically breadcrumbs from VS C*de
  {
    "Bekaboo/dropbar.nvim",
    -- optional, but required for fuzzy finder support
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    config = function()
      local dropbar_api = require("dropbar.api")
      vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
      vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
      vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })
    end,
  },
}

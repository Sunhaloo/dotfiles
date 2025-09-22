return {
  "saghen/blink.cmp",
  opts = {
    -- how blink will internal fuzzy finder will work
    fuzzy = { implementation = "prefer_rust" },

    snippets = { preset = "luasnip" },

    -- keymap = {
    --   preset = "super-tab",
    --   ["<Tab>"] = { "select_and_accept" },
    --
    -- },

    keymap = {
      preset = "super-tab",
      ["<Tab>"] = { "select_and_accept", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" }, -- optional, for Shift+Tab
    },

    completion = {
      ghost_text = {
        enabled = false,
      },
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

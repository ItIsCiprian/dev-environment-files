return {
  "lewis6991/gitsigns.nvim", -- Plugin name

  -- Events that trigger the plugin (BufReadPre and BufNewFile)
  event = { "BufReadPre", "BufNewFile" },

  config = function()
    -- Configuration for the gitsigns.nvim plugin
    require("gitsigns").setup({
      -- Your plugin configuration goes here
      -- For example:
      signs = {
        add = { hl = "GitSignsAdd", text = "▎" },
        change = { hl = "GitSignsChange", text = "▎" },
        delete = { hl = "GitSignsDelete", text = "_▎" },
        topdelete = { hl = "GitSignsDelete", text = "‾▎" },
      },
      numhl = false,
      linehl = false,
      keymaps = {},
    })
  end,
}

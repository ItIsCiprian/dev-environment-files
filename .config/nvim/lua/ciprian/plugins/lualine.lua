-- Configuration for the lualine status line in Neovim.
-- Includes custom theming and additional functionality for displaying pending updates from 'lazy.status'.
return {
  "nvim-lualine/lualine.nvim",
  -- Dependency on 'nvim-tree/nvim-web-devicons' for file icons.
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    -- Integration with 'lazy.status' for displaying lazy.nvim update notifications.
    local lazy_status = require("lazy.status")

    -- Define a custom color palette for the lualine theme.
    local colors = {
      blue = "#65D1FF",
      green = "#3EFFDC",
      violet = "#FF61EF",
      yellow = "#FFDA7B",
      red = "#FF4A4A",
      fg = "#c3ccdc",  -- Foreground color
      bg = "#112638",  -- Background color
      inactive_bg = "#2c3043",  -- Background color for inactive sections
    }

    -- Custom theme configuration using the defined color palette.
    local my_lualine_theme = {
      normal = {
        a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      insert = {
        a = { bg = colors.green, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      visual = {
        a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      command = {
        a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      replace = {
        a = { bg = colors.red, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      inactive = {
        a = { bg = colors.inactive_bg, fg = colors.fg, gui = "bold" },
        b = { bg = colors.inactive_bg, fg = colors.fg },
        c = { bg = colors.inactive_bg, fg = colors.fg },
      },
    }

    -- Setup lualine with the custom theme and configuration for displaying additional information.
    lualine.setup({
      options = {
        theme = my_lualine_theme,
      },
      sections = {
        lualine_x = {
          {
            "function",
            function()
              return lazy_status.updates()
            end,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },  -- Highlight color for update notifications.
          },
          { "encoding" },  -- Display file encoding.
          { "fileformat" },  -- Display file format (e.g., unix, dos).
          { "filetype" },  -- Display the filetype of the current buffer.
        },
      },
    })
  end,
}

-- Configuration for 'alpha-nvim' with a custom dashboard on Neovim startup
return {
  "goolord/alpha-nvim", -- Plugin name
  event = "VimEnter", -- Trigger the config when Vim starts
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- Depend on 'nvim-web-devicons' for icons

  -- Configuration function for the plugin
  config = function()
    local alpha = require("alpha") -- Import alpha for the startup screen
    local dashboard = require("alpha.themes.dashboard") -- Use the dashboard theme from alpha

    -- Custom header for the startup screen
    dashboard.section.header.val = {
      "                                                     ",
      "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
      "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
      "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
      "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      "                                                     ",
    }

    -- Custom menu for the dashboard with buttons to perform common tasks
    dashboard.section.buttons.val = {
      dashboard.button("e", "  > New File", "<cmd>ene<CR>"), -- New file button
      dashboard.button("SPC ee", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"), -- File explorer toggle
      dashboard.button("SPC ff", "󰱼 > Find File", "<cmd>Telescope find_files<CR>"), -- Find file button
      dashboard.button("SPC fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"), -- Find word in files
      dashboard.button("SPC wr", "󰁯  > Restore Session", "<cmd>SessionRestore<CR>"), -- Restore last session
      dashboard.button("q", " > Quit NVIM", "<cmd>qa<CR>"),
      -- Quit Neovim button
    }

    -- Set up alpha with the configured dashboard options
    alpha.setup(dashboard.opts)

    -- Ensure that folding is disabled in the alpha dashboard buffer for a clean look
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}

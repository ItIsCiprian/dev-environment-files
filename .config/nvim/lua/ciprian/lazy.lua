
-- Set up the path for lazy.nvim installation.
local lazyPath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check if lazy.nvim is already installed.
-- If not, clone it from the GitHub repository to the designated path.
if not vim.loop.fs_stat(lazyPath) then
  -- Clone the stable branch of lazy.nvim using Git.
  -- The '--filter=blob:none' option is used to clone without large files for a faster setup.
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none", -- Minimize data transfer by excluding large files.
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- Specify the stable branch for a reliable experience.
    lazyPath, -- Destination path for the cloned repository.
  })
end

-- Prepend the lazy.nvim path to Vim's runtime path for loading.
vim.opt.rtp:prepend(lazyPath)

-- Initialize lazy.nvim with a configuration table.
require("lazy").setup({
  {
    -- Specify the plugin to load and its configuration.
    "kdheepak/lazygit.nvim",
    dependencies = {
      -- List dependencies required by the plugin for full functionality.
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      -- Load the 'lazygit' extension for Telescope upon plugin initialization.
      require("telescope").load_extension("lazygit")
    end,
  },
  -- Import additional plugins configurations from specified paths.
  { import = "ciprian.plugins" },
  { import = "ciprian.plugins.lsp" },
}, {
  -- Configuration options for the installer.
  install = {
    colorscheme = { "catppucin" }, -- Set 'catppucin' as the default colorscheme.
  },
  -- Plugin health check configuration.
  checker = {
    enabled = true, -- Enable plugin health checks.
    notify = false, -- Disable notifications for the health checks.
  },
  -- Configuration for change detection.
  change_detection = {
    notify = false, -- Disable notifications for detected changes.
  },
})

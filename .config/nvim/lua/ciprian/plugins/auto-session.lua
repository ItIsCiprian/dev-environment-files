-- Configuration for the 'auto-session' plugin to manage Neovim sessions automatically
return {
  "rmagatti/auto-session",  -- Plugin name
  
  -- The 'config' function contains setup and configuration for the plugin
  config = function()
    -- Require and setup auto-session with custom settings
    local auto_session = require("auto-session")
    auto_session.setup({
      auto_restore_enabled = false,  -- Disables automatic restoration of the last session
      -- Specifies directories to suppress auto session creation/restoration
      auto_session_suppress_dirs = {
        "~/",           -- Home directory
        "~/Dev/",       -- Development directory
        "~/Downloads",  -- Downloads directory
        "~/Documents",  -- Documents directory
        "~/Desktop/",   -- Desktop directory
      },
    })

    -- Shorten the 'vim.keymap' namespace for easier access
    local keymap = vim.keymap

    -- Map keys for session management
    -- Keybinding to restore the last session for the current working directory
    keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" })
    
    -- Keybinding to save the current session
    keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" })
  end,
}

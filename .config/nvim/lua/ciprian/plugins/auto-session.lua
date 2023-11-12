-- Configuration for the 'auto-session' plugin
return {
  "rmagatti/auto-session", -- Specify the plugin name and repository

  config = function()
    local auto_session = require("auto-session")

    -- Set up auto-session with specific configurations
    auto_session.setup({
      auto_restore_enabled = false, -- Disable auto session restore
      auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" }, -- Directories to suppress auto session save/restore
    })

    local keymap = vim.keymap

    -- Define key mappings for session management
    keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" }) -- Map to restore the last workspace session for the current directory
    keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" }) -- Map to save workspace session for the current working directory
  end,
}

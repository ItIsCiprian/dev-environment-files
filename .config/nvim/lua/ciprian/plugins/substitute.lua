-- This configuration is for the 'substitute.nvim' plugin, which enhances the substitution capabilities in Neovim.
return {
  "gbprod/substitute.nvim",  -- Plugin identifier for use with a Neovim package manager.
  
  -- This plugin is lazy-loaded on these events to improve startup time.
  event = { "BufReadPre", "BufNewFile" },
  
  -- The 'config' function contains the setup and configuration for the plugin.
  config = function()
    -- Load the 'substitute' module from the plugin.
    local substitute = require("substitute")
    
    -- Initialize the plugin with default settings.
    substitute.setup()
    
    -- Shortcut to 'vim.keymap' for setting key mappings more concisely.
    local keymap = vim.keymap
    
    -- Mapping 's' in normal mode to perform a substitute operation with motion.
    -- This allows substituting text based on movement commands (e.g., 'sw' to substitute a word).
    keymap.set("n", "s", substitute.operator, { desc = "Substitute with motion" })
    
    -- Mapping 'ss' in normal mode to substitute the current line.
    -- This is a quick way to replace the entire line the cursor is on.
    keymap.set("n", "ss", substitute.line, { desc = "Substitute line" })
    
    -- Mapping 'S' in normal mode to substitute from the cursor to the end of the line.
    -- This replaces the text from the cursor's position to the end of the current line.
    keymap.set("n", "S", substitute.eol, { desc = "Substitute to end of line" })
    
    -- Mapping 's' in visual mode to perform a substitution within the selected text.
    -- This allows for substituting a specific portion of text selected in visual mode.
    keymap.set("x", "s", substitute.visual, { desc = "Substitute in visual mode" })
  end,
}

-- Configuration for the indent-blankline.nvim plugin
return {
  "lukas-reineke/indent-blankline.nvim",  -- Plugin identifier
  event = { "BufReadPre", "BufNewFile" }, -- Load plugin on buffer read or new file creation
  main = "ibl",                           -- Main module name for the plugin
  opts = {
    indent = { char = "┊" },              -- Set the character used for indentation guides
  },
}

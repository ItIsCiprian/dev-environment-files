-- Return a configuration table for setting up the nvim-treesitter plugin
return {
  {
    "nvim-treesitter/nvim-treesitter",  -- The plugin repository
    event = { "BufReadPre", "BufNewFile" },  -- Load the plugin on pre-buffer read and when new files are created
    build = ":TSUpdate",  -- Build command to update treesitter definitions
    dependencies = {
      "windwp/nvim-ts-autotag",  -- Depend on nvim-ts-autotag plugin for auto-closing and auto-renaming HTML tags
    },
    config = function()
      -- Configure nvim-treesitter plugin
      require("nvim-treesitter.configs").setup({
        highlight = {
          enable = true,  -- Enable syntax highlighting using treesitter
        },
        indent = {
          enable = true,  -- Enable improved indentation support with treesitter
        },
        autotag = {
          enable = true,  -- Enable automatic tag management for HTML, XML, etc.
        },
        -- List of language parsers to ensure are installed
        ensure_installed = {
          "json", "javascript", "typescript", "tsx", "yaml", "html", "css",
          "prisma", "markdown", "markdown_inline", "svelte", "graphql", "bash",
          "lua", "vim", "dockerfile", "gitignore",
        },
        auto_install = true,  -- Automatically install missing parsers when opening a buffer
      })

      -- Additional configuration for contextual comment strings (adjust comments based on the cursor location in the file)
      require("ts_context_commentstring").setup({
        -- Module-specific configuration would go here
      })

      -- Optimize loading by skipping unnecessary processing
      vim.g.skip_ts_context_commentstring_module = true  -- Global flag to skip context comment string module
    end,
  },
}

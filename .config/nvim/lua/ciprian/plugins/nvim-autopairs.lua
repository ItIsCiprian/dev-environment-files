-- Configuration for nvim-autopairs, a plugin that automatically inserts pairs like
-- parentheses, brackets, and quotes. It's set to activate on entering insert mode and
-- is configured to work seamlessly with nvim-cmp for autocompletions.
return {
  "windwp/nvim-autopairs",
  -- Activate the plugin when entering insert mode to improve startup performance.
  event = { "InsertEnter" },
  -- nvim-cmp is a dependency for integration with completion items.
  dependencies = { "hrsh7th/nvim-cmp" },
  config = function()
    -- Import the nvim-autopairs module.
    local autopairs = require("nvim-autopairs")

    -- Setup nvim-autopairs with additional configuration.
    autopairs.setup({
      check_ts = true, -- Enable integration with Neovim's built-in Tree-sitter for smarter pair insertions.
      ts_config = {
        -- Specify behavior for specific file types with Tree-sitter parsing.
        lua = { "string" }, -- Exclude pairs inside Lua string nodes to prevent conflicts.
        javascript = { "template_string" }, -- Exclude pairs in JavaScript template strings.
        java = false, -- Disable Tree-sitter checking for Java entirely.
      },
    })

    -- Setup integration between nvim-autopairs and nvim-cmp to ensure that
    -- auto-inserted pairs are correctly handled during auto-completions.
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp") -- Import nvim-cmp to access its event system.
    
    -- Link nvim-cmp's confirmation event with nvim-autopairs to handle the insertion
    -- of pairs when a completion item is selected and confirmed.
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}

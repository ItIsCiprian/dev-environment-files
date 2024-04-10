-- Configuration for gitsigns.nvim, a Neovim plugin for Git integration.
return {
  "lewis6991/gitsigns.nvim",
  -- Load the plugin on these events for performance optimization.
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    -- Custom function to attach key mappings when gitsigns is activated for a buffer.
    on_attach = function(bufnr)
      -- Safely access the gitsigns module from loaded packages.
      local gitsigns = package.loaded.gitsigns

      -- Helper function to simplify key mapping with descriptive comments.
      local function map(mode, lhs, rhs, description)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = description })
      end

      -- Navigation mappings: Jump between hunks.
      map("n", "]h", gitsigns.next_hunk, "Go to next hunk")
      map("n", "[h", gitsigns.prev_hunk, "Go to previous hunk")

      -- Action mappings: Perform Git operations on hunks.
      map("n", "<leader>hs", gitsigns.stage_hunk, "Stage current hunk")
      map("n", "<leader>hr", gitsigns.reset_hunk, "Reset current hunk")
      -- Visual mode mappings allow staging or resetting selected hunks.
      map("v", "<leader>hs", function() gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Stage selected hunk")
      map("v", "<leader>hr", function() gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Reset selected hunk")

      -- Buffer-wide actions.
      map("n", "<leader>hS", gitsigns.stage_buffer, "Stage entire buffer")
      map("n", "<leader>hR", gitsigns.reset_buffer, "Reset entire buffer")
      map("n", "<leader>hu", gitsigns.undo_stage_hunk, "Undo last staged hunk")

      -- Hunk preview and blame.
      map("n", "<leader>hp", gitsigns.preview_hunk, "Preview hunk")
      map("n", "<leader>hb", function() gitsigns.blame_line({ full = true }) end, "Blame current line")
      map("n", "<leader>hB", gitsigns.toggle_current_line_blame, "Toggle blame for current line")

      -- Diff viewing.
      map("n", "<leader>hd", gitsigns.diffthis, "Show diff for current file")
      map("n", "<leader>hD", function() gitsigns.diffthis("~") end, "Show diff for current file against last commit")

      -- Text object for hunks, usable in visual and operator pending modes.
      map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Select hunk text object")
    end,
  },
}

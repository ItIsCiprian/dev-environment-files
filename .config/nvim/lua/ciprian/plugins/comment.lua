-- Configuration for Comment.nvim with dependency on nvim-ts-context-commentstring
return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
  config = function()
    -- Safely require Comment and ts_context_commentstring modules
    local status_comment, comment = pcall(require, "Comment")
    local status_ts_context, ts_context_commentstring = pcall(require, "ts_context_commentstring.integrations.comment_nvim")

    -- Ensure both modules are loaded successfully
    if not status_comment or not status_ts_context then
      print("Failed to load Comment or ts_context_commentstring module")
      return
    end

    -- Setup Comment with ts_context_commentstring integration for enhanced commenting in tsx and jsx files
    comment.setup({
      pre_hook = ts_context_commentstring.create_pre_hook(),
    })
  end,
}
